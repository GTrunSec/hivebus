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
    homeModules = cell.homeModules;
    nixosProfiles = {};
    overlays = cell.overlays;
  })
  .addExporters [
    (POP.lib.extendPop pops.exporter (self: super: {
      exports =
        (haumea.lib.load {
          src = ./pops;
          inputs = {
            inherit cell;
            inputs = removeAttrs inputs ["self"];
            self' = self;
          };
        })
        // {
          nixosModules = l.mapAttrs (_: v: v.outputsForTarget "nixosModules") self.recipes.nixosModules;
          homeModules = l.mapAttrs (_: v: v.outputsForTarget "nixosModules") self.recipes.homeModules;
          overlays = self.recipes.overlays.outputsForTarget "default";
        };
    }))
  ])
