{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = cell.overlays.desktop;
    };
    imports = cell.nixosSuites.desktop;
  };

  # libvirtd machines
  libvirtd_1 = import ./nixosConfigurations/libvirtd_1 {inherit inputs cell;};

  vultr = {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      overlays = cell.overlays.vultr;
    };
    imports =
      [
        ./nixosConfigurations/vultr/hardware-configuration.nix
        {
          networking.hostName = "vultr";
        }
      ]
      ++ cell.nixosSuites.vultr;
  };

  flops = {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = cell.overlays.desktop;
    };
    imports = [
      ({...} @ args:
        (((pops.default.setInitRecipes {
              nixos.default = inputs.cells.nixos.nixosModules.default;
            })
            .addArgsExtender {nixos.default = args;})
          .addExporters [
            (POP.lib.extendPop pops.exporter (self: super: {
              exports.nixos = (self.recipes.nixos.default.addInputs
                self.args.nixos.default)
              .outputsForTarget "nixosModules";
            }))
          ])
        .exports
        .nixos)
    ];
  };
}
