{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
in {
  home = {
    bee.system = "x86_64-linux";
    bee.pkgs = inputs.nixos.legacyPackages;
    imports = [];
  };
}
