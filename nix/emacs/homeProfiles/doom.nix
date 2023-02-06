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

  src = "${(std.incl self ["profiles/doom-emacs"])}/profiles/doom-emacs";
  onChange = ''
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

       ln -sfT "$HOME/ghq/github.com/GTrunSec/hive/profiles/doom-emacs/modules" $HOME/.doom.d/modules

       mkdir -p $HOME/.doom.d/{etc,autoload}
       mkdir -p $HOME/.doom.d/modules/private/{my-code,my-org}
       ln -sfT "$HOME/ghq/github.com/GTrunSec/hive/profiles/doom-emacs/snippets" $HOME/.doom.d/snippets
    fi
  '';

  home.file.".doom.d/config.org" = {
    source = src + "/config.org";
    inherit onChange;
  };
}
