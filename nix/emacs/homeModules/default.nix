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
          # package = pkgs.emacsGit.overrideAttrs (old: {
          #   plugins = old.plugins ++ (p: with p; [tree-sitter-nix tree-sttier-nickel]);
          # });
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
