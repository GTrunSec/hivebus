{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  inherit (inputs.cells-lab.common.lib) callFlake;

  l = nixpkgs.lib // builtins;

  # __inputs__ = callFlake "${(std.incl self ["lock"])}/lock" {
  __inputs__ = callFlake ./lib/lock {
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
in
  inputs.cells-lab.inputs.xnlib.lib.digga
  // {
    inherit __inputs__;

    importRakeLeaves = path:
      l.mapAttrs (_: v:
        if (l.isFunction (import v))
        then import v {inherit inputs cell;}
        else import v)
      (cell.lib.rakeLeaves path);
  }
