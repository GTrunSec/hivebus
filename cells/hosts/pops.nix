{
  inputs,
  cell,
}: let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
  inherit (inputs) haumea;

  l = inputs.nixpkgs.lib // builtins;
in ((pops.default.setInitRecipes {
    # host_1 = inputs.cells.nixos .modules.host_1
    # load current hosts's nixos modules
    nixosModules = cell.nixosModules;
    nixosProfiles = {};
    overlays = cell.overlays;
  })
  .addExporters [
    (POP.lib.extendPop pops.exporter (self: super: {
      exports = let
        nixosModules = {
          flops = self.recipes.nixosModules.flops.outputsForTarget "nixosModules";
        };
        overlays = self.recipes.overlays.outputsForTarget "default";
      in
        (haumea.lib.load {
          src = ./pops;
          inputs = {
            inherit cell;
            inputs = removeAttrs inputs ["self"];
            inherit nixosModules overlays;
            self' = self;
          };
        })
        // {
          inherit nixosModules overlays;
        };
    }))
  ])
