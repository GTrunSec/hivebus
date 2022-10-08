{
  inputs,
  cell,
}: let
  inherit (cell.packages) styx;
  styx-themes = import styx.themes;
in {
  styx = import styx {
    # Used packages
    pkgs = inputs.nixpkgs;

    # Used configuration
    config = [
      ./conf.nix
      {}
    ];

    # Loaded themes
    themes = [
      styx-themes.generic-templates
      ./themes/styx-site
    ];

    # Environment propagated to templates
    env = {inherit data pages;};
  };
}
