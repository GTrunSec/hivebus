{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation.initDoomEmacs = config.lib.dag.entryAfter ["writeBoundary"] ''
     if [ ! -d "$HOME/.emacs.d/bin" ];then
        ${lib.getExe pkgs.git} clone https://github.com/doomemacs/doomemacs ~/.emacs.d
     fi

    if [ ! -d "$HOME/.doom.d" ];then
       mkdir -p $HOME/.doom.d/
       cp "$HOME/ghq/github.com/GTrunSec/hive/profiles/doom-emacs/init.el" \
       "$HOME/.doom.d/init.el"

       ln -sfT "$HOME/ghq/github.com/GTrunSec/hive/profiles/doom-emacs/modules" \
       $HOME/.doom.d/modules

       mkdir -p $HOME/.doom.d/{etc,autoload}
       mkdir -p $HOME/.doom.d/modules/private/{my-code,my-org}
       ln -sfT "$HOME/ghq/github.com/GTrunSec/hive/profiles/doom-emacs/snippets" $HOME/.doom.d/snippets
       ~/.emacs/bin/doom sync
    fi
  '';
}
