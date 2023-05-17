{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
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
}
