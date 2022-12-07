{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  doom = {config, pkgs, ...}: let
    src = "${(std.incl self ["profiles/doom-emacs"])}/profiles/doom-emacs";
    onChange = ''
      export PATH=${pkgs.emacs}/bin:$PATH
      cd $HOME/.doom.d/
      # emacs -Q -batch -l 'lisp/compile.el'
      $HOME/.emacs.d/bin/doom sync
    '';
  in {
    home.file.".doom.d/config.org" = {
      source = src + "/config.org";
      inherit onChange;
    };

    home.file.".doom.d/meow.org" = {
      source = src + "/meow.org";
      inherit onChange;
    };
  };
in {
  linux = {
    imports = [
      doom
      cell.homeModules.linux
      cell.homeModules.doom
    ];
  };
  darwin = {
    imports = [
      doom
      cell.homeModules.darwin
      cell.homeModules.doom
    ];
  };
}
