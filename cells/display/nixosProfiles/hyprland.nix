{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.common.lib) __inputs__;
  l = inputs.nixpkgs.lib // builtins;
in rec {
  default = {
    imports = [
      __inputs__.hyprland.nixosModules.default
      cell.nixosModules.hyprland
      ({config, ...}: let
        cfg = config.programs.hyprland.hiveProfiles;
      in {
        config = with l;
          mkMerge [
            (mkIf cfg.nvidia {programs.hyprland.package = __inputs__.hyprland.packages.hyprland-nvidia;})
          ];
      })
    ];
    programs.hyprland.enable = true;
  };

  displayManager = name: {
    imports = [cell.nixosModules.${name}];
    programs.hyprland.hiveProfiles = {
      displayManager = true;
    };
  };

  guangtao = {
    imports = [
      default
      # (displayManager "sddm")
    ];
    programs.hyprland.hiveProfiles = {
      getty = true;
      autoLogin = true;
      user = "guangtao";
      shell = "zsh";
    };
  };
}
