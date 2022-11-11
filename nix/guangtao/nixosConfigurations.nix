{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = import ./nixosConfigurations/desktop {inherit inputs cell;};

  # libvirtd machines
  libvirtd_1 = import ./nixosConfigurations/libvirtd_1 {inherit inputs cell;};
}
