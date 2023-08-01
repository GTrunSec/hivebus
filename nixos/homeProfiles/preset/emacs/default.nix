_:
{
  config,
  pkgs,
  lib,
  ...
}:
{
  config =
    with lib;
    mkMerge [
      (mkIf pkgs.stdenv.isLinux {
        programs.emacs = {
          enable = true;
          package = pkgs.emacs-pgtk;

          extraPackages =
            epkgs:
            with epkgs; [
              vterm
              grab-x-link
            ];
        };
        services.emacs.client.enable = true;
      })
    ];
}
