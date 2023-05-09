{
  inputs,
  cell,
}: let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
in {
  default = inputs.flops.lib.configs.haumea.setInit {
    src = inputs.self + "/nixos/profiles";
    inputs = {
      inherit cell;
      inputs = removeAttrs inputs ["self"];
      pkgs' = inputs.nixpkgs;
    };
  };
}
