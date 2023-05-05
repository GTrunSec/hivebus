{
  inputs,
  cell,
}: {
  default = inputs.flops.lib.configs.haumea.setInit {
    src = inputs.self + "/nixos/profiles";
    inputs = {
      inherit cell;
      inputs = removeAttrs inputs ["self"];
      lib = inputs.nixpkgs.lib;
    };
  };
}
