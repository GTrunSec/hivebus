{
  inputs,
  cell,
}: let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;

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
      exports = rec {
        flops = {
          imports = [
            nixosModules.flops
            (self.recipes.nixosModules.flops.outputsForTarget "nixosModules")

            cell.nixosSuites.flops
            (cell.lib.mkHome "guangtao" "flops" "zsh")
          ];
          overlays = overlays.flops;
        };
        overlays = self.recipes.overlays.outputsForTarget "default";
        nixosModules = {
          flops = self.recipes.nixosModules.flops.outputsForTarget "nixosModules";
        };
      };
    }))
  ])
