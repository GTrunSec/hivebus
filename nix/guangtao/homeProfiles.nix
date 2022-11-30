{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  shellPrograms = import ./homeProfiles/shellPrograms.nix;
  shellPackages = import ./homeProfiles/shellPackages.nix {inherit inputs cell;};
}
