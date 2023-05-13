{
  inputs,
  profiles,
}: {
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs.cells.common.lib) __utils__;

  src = profiles + "/doom-emacs";
  onChange = ''
    export PATH=/run/current-system/etc/profiles/per-user/$USER/bin:/opt/homebrew/bin:$PATH
    $HOME/.emacs.d/bin/doom sync
  '';
in {
  config = lib.mkMerge [
    {
      home.activation.initDoomEmacs = config.lib.dag.entryAfter ["writeBoundary"] ''
         if [ ! -d "$HOME/.emacs.d/bin" ];then
            ${lib.getExe pkgs.git} clone https://github.com/doomemacs/doomemacs ~/.emacs.d
         fi
        if [ ! -d "$HOME/.doom.d" ];then
           mkdir -p $HOME/.doom.d/
           cp "$HOME/ghq/github.com/GTrunSec/hive/profiles/doom-emacs/init.el" "$HOME/.doom.d/init.el"
           mkdir -p $HOME/.doom.d/{etc,autoload}
           ln -sfT "$HOME/ghq/github.com/GTrunSec/hive/profiles/doom-emacs/snippets" $HOME/.doom.d/snippets
        fi
      '';

      home.file.".doom.d/config.org" = {
        source = src + "/config.org";
        inherit onChange;
      };

      home.file.".doom.d/static/sketchviz".source = let
        env = pkgs.applyPatches {
          name = "sketchviz-env";
          src = __utils__.sketchviz;
          patches = [./exit.patch];
        };
      in
        env;
    }
  ];
}
