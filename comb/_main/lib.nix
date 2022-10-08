{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  inherit (inputs.cells-lab.main.lib) callFlake;

  l = nixpkgs.lib // builtins;

  __default__ = callFlake "${(std.incl self [(self + /lock/default)])}/lock/default" {
    nixpkgs.locked = inputs.nixpkgs-lock.sourceInfo;
    nixos.locked =
      inputs.nixos.sourceInfo
      // {
        type = "github";
        owner = "NixOS";
        repo = "nixpkgs";
      };

    colmena.inputs.nixpkgs = "nixpkgs";
    sops-nix.inputs.nixpkgs = "nixos";
    ragenix.inputs.nixpkgs.follows = "nixos";
  };

  __misc__ = callFlake "${(std.incl self [(self + /lock/misc)])}/lock/misc" {
    nixpkgs.locked = inputs.nixpkgs-lock.sourceInfo;
    nixos.locked =
      inputs.nixos.sourceInfo
      // {
        type = "github";
        owner = "NixOS";
        repo = "nixpkgs";
      };

    styx.inputs.nixpkgs = "nixpkgs";
  };
in {
  inherit
    l
    __default__
    __misc__
    ;
}
