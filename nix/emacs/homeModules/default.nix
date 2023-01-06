{
  pkgs,
  lib,
  ...
}: {
  config = with lib;
    mkMerge [
      (mkIf pkgs.stdenv.isLinux {
        programs.emacs = {
          enable = true;
          package = pkgs.emacsPgtk;
        };
        services.emacs.client.enable = true;
      })
      (mkIf pkgs.stdenv.isDarwin {
        home.packages = [
          pkgs.emacs
        ];
      })
    ];
}
