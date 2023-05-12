inputs.flops.lib.configs.haumea.setInit {
  src = inputs.self + "/nixos/darwinProfiles";
  inputs = {
    inherit cell;
    inputs = removeAttrs inputs ["self"];
    pkgs' = inputs.nixpkgs;
    lib = inputs.nixpkgs.lib;
  };
}
