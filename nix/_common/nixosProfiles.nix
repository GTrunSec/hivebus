{
  inputs,
  cell,
} @ args: let
  inherit (inputs) nixpkgs;
in {
  bootstrap = import ./nixosProfiles/bootstrap.nix args;

  nix = import ./nixosProfiles/nix.nix args;
}
