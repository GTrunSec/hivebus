{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs haumea flops;

  l = nixpkgs.lib // builtins;

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
  // {
    inherit callInputs callUtils callMainInputs;

    __inputs__ =
      (callInputs.addInputsOverride {
        # nixpkgs = callMainInputs.sysInputs.nixos;
      })
      .outputsForInputsCompat;

    __utils__ = (callUtils.addInputsOverride {}).outputsForInputsCompat;
  }
