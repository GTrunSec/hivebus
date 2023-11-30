let
  inherit (inputs) nixpkgs;
in
import (nixpkgs.outPath + "/nixos/lib/eval-config.nix") rec {
  system = super.layouts.system;
  pkgs = import nixpkgs { inherit system; };
  modules = lib.flatten [ super.layouts.nixosSuites ];
}
