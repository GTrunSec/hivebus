let
  inherit (inputs) std self;
  profiles = "${(std.incl self ["profiles"])}/profiles";
in
inputs.flops.lib.haumea.pops.default.setInit {
  src = inputs.self + "/nixos/homeProfiles";
  inputs = {
    inherit cell profiles inputs;
    pkgs' = inputs.nixpkgs;
    lib = inputs.nixpkgs.lib;
  };
}
