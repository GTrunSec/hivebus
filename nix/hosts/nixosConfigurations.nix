{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
  l = inputs.nixpkgs.lib // builtins;

  default =
    ((pops.default.setInitRecipes {
        nixos = {
          default = inputs.cells.nixos.modules.default;
          profiles = inputs.cells.nixos.profiles.default;
        };
      })
      .addExporters [
        (POP.lib.extendPop pops.exporter (self: super: {
          exports.nixos = self.recipes.nixos.profiles.outputsForTarget "default";
        }))
      ])
    .exports
    .nixos;
in {
  flops = {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [];
    };
    imports = l.attrValues default.bootstrap ++ [
      cell.profiles.flops
    ];
  };
}
