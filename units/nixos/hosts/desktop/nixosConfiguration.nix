{
  inputs,
  super,
  lib,
}:
let
  inherit (inputs) nixpkgs;
in
import (super.layouts.hive.bee.pkgs.path + "/nixos/lib/eval-config.nix") rec {
  system = super.layouts.system;
  pkgs = super.layouts.hive.bee.pkgs;
  modules = lib.flatten [ super.layouts.nixosSuites ];
}
