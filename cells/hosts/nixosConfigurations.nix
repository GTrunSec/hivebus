{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (cell.pops) exports;
in {
  desktop = let
    system = "x86_64-linux";
  in {
    bee.system = system;
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit system;
      config.allowUnfree = true;
      overlays = l.flatten exports.desktop.overlays;
    };
    imports = l.flatten exports.desktop.imports;
  };

  flops = let
    system = "x86_64-linux";
  in {
    bee.system = system;
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit system;
      config.allowUnfree = true;
      overlays = l.flatten exports.flops.overlays;
    };
    imports = l.flatten exports.flops.imports;
  };

  vultr = let
    system = "x86_64-linux";
  in {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      overlays = l.flatten exports.vultr.overlays;
    };
    imports =
      l.flatten exports.vultr.imports
      ++ [
        ./nixosConfigurations/vultr/hardware-configuration.nix
      ];
  };
}
