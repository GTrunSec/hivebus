{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (cell) homeModules;
in rec {
  brave = {
    imports = [homeModules.brave];
  };
  firefox =
    {
      imports = [homeModules.firefox];
    }
    // import ./firefox.nix {inherit inputs cell;};
  guangtao = {
    imports = [firefox];
  };
}
