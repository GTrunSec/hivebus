{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;
in {
  shellPrograms = import ./homeProfiles/shellPrograms.nix;
  shellPackages = import ./homeProfiles/shellPackages.nix {inherit inputs cell;};
  latexPackages = import ./homeProfiles/shellPackages.nix {inherit inputs cell;};
  darwinPackages = import ./homeProfiles/darwinPackages.nix {inherit inputs cell;};
}
