{
  inputs,
  cell,
}: let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
in ((pops.default.setInitRecipes {
    nixos = {
      modules = {
        default = inputs.cells.nixos.modules.default;
        # host_1 = inputs.cells.nixos.modules.host_1;
      };
      profiles.default = inputs.cells.nixos.profiles.default;
    };
  })
  .addExporters [
    (POP.lib.extendPop pops.exporter (self: super: {
      exports.nixos = {
        profiles.default = self.recipes.nixos.profiles.default.outputsForTarget "default";
        modules.default = self.recipes.nixos.modules.default.outputsForTarget "nixosModules";
      };
    }))
  ])
