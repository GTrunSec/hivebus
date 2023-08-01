{ inputs, cell }:
let
  inherit (inputs)
    haumea
    flops
    std
    self
  ;

  profiles = "${(std.incl self [ "profiles" ])}/profiles";
in
flops.lib.configs.haumea.setInit {
  src = inputs.self + "/nixos/homeProfiles";
  inputs = {
    inherit cell profiles;
    inputs = removeAttrs inputs [ "self" ];
    pkgs' = inputs.nixpkgs;
    lib = inputs.nixpkgs.lib;
  };
}
