{
  inputs,
  cell,
}: {
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) std self;
  inherit (inputs.cells.common.lib) __utils__;

  src = "${(std.incl self ["profiles/doom-emacs"])}/profiles/doom-emacs";
  onChange = ''
    export PATH=/run/current-system/etc/profiles/per-user/$USER/bin:/opt/homebrew/bin:$PATH
    $HOME/.emacs.d/bin/doom sync
  '';
in {
  imports = [cell.homeModules.default];

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

  home.packages = [
    pkgs.graphviz
    (pkgs.symlinkJoin {
      name = "dotsk";
      pathsToLink = ["/lib" "/bin"];
      paths = with pkgs.nodePackages; [
        roughjs
        jsdom
      ];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        makeWrapper ${pkgs.nodejs_latest}/bin/node $out/bin/dotsk \
         --set NODE_PATH $out/lib/node_modules
      '';
    })
  ];

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
