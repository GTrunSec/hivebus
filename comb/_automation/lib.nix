{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  inherit (inputs.cells-lab.main.lib) callFlake;

  l = nixpkgs.lib // builtins;

  __default__ = callFlake "${(std.incl self [(self + /lock/default)])}/lock/default" {
    nixpkgs.locked = inputs.nixpkgs-lock.sourceInfo;
    colmena.inputs.nixpkgs = "nixpkgs";
  };
in {
  inherit l __default__;
}
