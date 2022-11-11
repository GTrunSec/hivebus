{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = import ./nixosConfigurations/desktop {inherit inputs cell;};


  # libvirtd machines
  lib = import ./nixosConfigurations/desktop {inherit inputs cell;};
}
