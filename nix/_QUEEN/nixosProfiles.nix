{
  inputs,
  cell,
} @ args: let
  inherit (inputs) nixpkgs;
in {
  bootstrap = import ./nixosProfiles/bootstrap.nix args;
}
