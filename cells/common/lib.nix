{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs haumea flops;

  l = nixpkgs.lib // builtins;

  # __inputs__ = callFlake "${(std.incl self ["lock"])}/lock" {
  callInputs =
    (flops.lib.flake.pops.default.setInitInputs ./lib/__lock)
    .setSystem
    nixpkgs.system;

  callUtils =
    (flops.lib.flake.pops.default.setInitInputs ./lib/__utils)
    .setSystem
    nixpkgs.system;

  callMainInputs =
    (flops.lib.flake.pops.default.setInitInputs inputs.self)
    .setSystem
    nixpkgs.system;
in
  haumea.lib.load {
    src = ./lib;
    inputs = removeAttrs inputs ["self"];
  }
  // inputs.std-ext.lib.digga
  // {
    inherit callInputs callUtils callMainInputs;

    __inputs__ =
      (callInputs.addInputsOverride {
        nixpkgs = callMainInputs.sysInputs.nixos;
      })
      .outputsForInputsCompat;

    __utils__ = (callUtils.addInputsOverride {}).outputsForInputsCompat;

    importRakeLeaves = path: args:
      l.mapAttrs (_: v:
        if (l.isFunction (import v))
        then import v args
        else import v)
      (cell.lib.rakeLeaves path);
  }
