inputs.flops.lib.configs.haumea.setInit {
  src = inputs.self + "/nixos/nixosProfiles";
  inputs = {
    inherit cell inputs;
    pkgs' = inputs.nixpkgs;
    __inputs__ = inputs.cells.common.lib.__inputs__;
  };
}
