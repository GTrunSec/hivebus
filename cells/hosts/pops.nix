{
  inputs,
  cell,
}: let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
in ((pops.default.setInitRecipes {
    nixosModules = {
      default = inputs.cells.nixos.nixosModules.default;
      # host_1 = inputs.cells.nixos.modules.host_1
      flops = cell.nixosModules.flops;
    };
    nixosProfiles.default = inputs.cells.nixos.nixosProfiles.default;
  })
  .addExporters [
    (POP.lib.extendPop pops.exporter (self: super: {
      exports = {
        nixosModules = {
          default = self.recipes.nixosModules.default.outputsForTarget "nixosModules";
          flops = self.recipes.nixosModules.flops.outputsForTarget "nixosModules";
        };
        nixosProfiles = {
          default = self.recipes.nixosProfiles.default.outputsForTarget "default";
        };
      };
    }))
  ])
