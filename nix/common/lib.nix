{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  inherit (inputs.cells-lab.common.lib) callFlake;

  l = nixpkgs.lib // builtins;

  __inputs__ = callFlake "${(std.incl self ["lock"])}/lock" {
    nixpkgs.locked = inputs.nixpkgs.sourceInfo;
    nixos.locked =
      inputs.nixos.sourceInfo
      // {
        type = "github";
        owner = "NixOS";
        repo = "nixpkgs";
      };

    sops-nix.inputs.nixpkgs = "nixos";
    ragenix.inputs.nixpkgs = "nixos";
    styx.inputs.nixpkgs = "nixpkgs";
  };
  digga-lib = {
    importers = import "${__inputs__.digga}/src/importers.nix" {
      lib = inputs.nixpkgs.lib;
    };
  };
in {
  inherit
    __inputs__
    ;

  l = l // digga-lib.importers;

  test-nixpkgs = nixpkgs.appendOverlays [
    cell.overlays.nomad
  ];
}
