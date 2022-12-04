{
  inputs,
  cell,
}: let
  init = {pkgs, ...}: {};
in rec {
  bee.system = "x86_64-darwin";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    system = "x86_64-darwin";
    config.allowUnfree = true;
    overlays = [];
  };
  imports =
    [
      init
    ]
    ++ [
      {
      }
    ]
    ++ cell.darwinSuites.macbook;
}
