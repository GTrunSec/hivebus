{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation.linkEmacsPrivate = config.lib.dag.entryAfter ["writeBoundary"] ''
     if [ ! -d "$HOME/.emacs.d" ];then
        ${lib.getExe pkgs.git} clone https://github.com/doomemacs/doomemacs ~/.emacs.d
     fi

    if [ ! -d "$HOME/.doom.d" ];then
       mkdir -p $HOME/.doom.d/
       mkdir -p $HOME/.doom.d/etc
    fi

    if [ ! -d "$HOME/.doom.d/modules" ];then
       ln -sfT "$HOME/.config/guangtao/nixos-flk/users/dotfiles/doom-emacs/lisp" $HOME/.doom.d/lisp
       ln -sfT "$HOME/.config/guangtao/nixos-flk/users/dotfiles/doom-emacs/bin" $HOME/.doom.d/bin
       ln -sfT "$HOME/.config/guangtao/nixos-flk/users/dotfiles/doom-emacs/snippets" $HOME/.doom.d/snippets
       ln -sfT "$HOME/.config/guangtao/nixos-flk/users/dotfiles/doom-emacs/modules" $HOME/.doom.d/modules
       ln -sfT "$HOME/.config/guangtao/nixos-flk/users/dotfiles/doom-emacs/Makefile" $HOME/.doom.d/Makefile
    fi

    if [ ! -d "$HOME/.doom.d/modules/my-code" ];then
         mkdir -p $HOME/.doom.d/modules/private/{my-org,my-code}
         mkdir -p $HOME/.doom.d/autoload
    fi
  '';
}
