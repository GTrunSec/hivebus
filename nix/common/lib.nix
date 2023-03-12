{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  inherit (inputs.std-ext.common.lib) callFlake;

  l = nixpkgs.lib // builtins;

  # __inputs__ = callFlake "${(std.incl self ["lock"])}/lock" {
  __inputs__ = callFlake ./lib/lock {
    nixpkgs.locked = inputs.nixpkgs.sourceInfo;
    nixos.locked =
      inputs.nixos-22-11.sourceInfo
      // {
        type = "github";
        owner = "NixOS";
        repo = "nixpkgs";
      };

    sops-nix.inputs.nixpkgs = "nixos";
    ragenix.inputs.nixpkgs = "nixos";
  };
in
  inputs.std-ext.lib.lib.digga
  // {
    inherit __inputs__;

    __utils__ = callFlake ./lib/utils {};

    importRakeLeaves = path: args:
      l.mapAttrs (_: v:
        if (l.isFunction (import v))
        then import v args
        else import v)
      (cell.lib.rakeLeaves path);
  }
