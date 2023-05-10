{
  inputs,
  cell,
}: let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;

  l = inputs.nixpkgs.lib // builtins;
in ((pops.default.setInitRecipes {
    nixosModules = {
      default = inputs.cells.nixos.nixosModules.default;
      # host_1 = inputs.cells.nixos .modules.host_1
      flops = cell.nixosModules.flops;
    };
    nixosProfiles.default = inputs.cells.nixos.nixosProfiles.default;
    homeProfiles = inputs.cells.nixos.homeProfiles;
    homeModules = inputs.cells.nixos.homeModules;
  })
  .addExporters [
    (POP.lib.extendPop pops.exporter (self: super: {
      exports = {
        flops = [
          (self.recipes.nixosModules.flops.outputsForTarget "nixosModules")
          (self.recipes.nixosModules.default.outputsForTarget "nixosModules")
        ];
        nixosModules = {
          default = self.recipes.nixosModules.default.outputsForTarget "nixosModules";
          flops = self.recipes.nixosModules.flops.outputsForTarget "nixosModules";
        };
        nixosProfiles = {
          default = self.recipes.nixosProfiles.default.outputsForTarget "default";
        };
        homeModules = {
          default = self.recipes.homeModules.default.outputsForTarget "nixosModules";
        };
        homeProfiles = self.recipes.homeProfiles.outputsForTarget "default";
      };
    }))
  ])
