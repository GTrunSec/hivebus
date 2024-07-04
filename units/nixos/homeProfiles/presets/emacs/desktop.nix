{
  config,
  pkgs,
  lib,
  inputs,
  omnibus,
}:
{
  imports = [
    omnibus.homeProfiles.presets.emacs.default
    omnibus.homeProfiles.presets.emacs.tree-sitter
  ];
  config =
    with lib;
    mkMerge [
      (mkIf pkgs.stdenv.isLinux {
        programs.emacs = {
          extraPackages =
            epkgs: with epkgs; [
              vterm
              grab-x-link
            ];
        };
        services.emacs.client.enable = true;
      })
    ];
}
