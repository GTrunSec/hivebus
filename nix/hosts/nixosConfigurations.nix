{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
  l = inputs.nixpkgs.lib // builtins;
in {
  flops = {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [];
    };
    imports = [
      ({pkgs, ...} @ args:
        (((pops.default.setInitRecipes {
              nixos.default = inputs.cells.nixos.modules.default;
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
