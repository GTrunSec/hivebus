{
  inputs,
  cell,
}: let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
in ((pops.default.setInitRecipes {
    overlays = cell.overlays;
    nixosModules = cell.nixosModules;
    nixosProfiles = cell.nixosProfiles;
    darwinProfiles = cell.darwinProfiles;
    homeProfiles = cell.homeProfiles;
    homeModules = cell.homeModules;
  })
  .addExporters [
    (POP.lib.extendPop pops.exporter (self: super: {
      exports = {
        overlays = self.recipes.overlays.outputsForTarget "default";

        nixpkgs = inputs.nixpkgs.appendOverlays self.exports.overlays;

        darwinProfiles = self.recipes.darwinProfiles.outputsForTarget "default";
        nixosProfiles = self.recipes.nixosProfiles.outputsForTarget "default";
        homeProfiles = self.recipes.homeProfiles.outputsForTarget "default";

        nixosModules.default = self.recipes.nixosModules.default.outputsForTarget "nixosModules";
        homeModules.default = self.recipes.homeModules.default.outputsForTarget "nixosModules";
      };
    }))
  ])
