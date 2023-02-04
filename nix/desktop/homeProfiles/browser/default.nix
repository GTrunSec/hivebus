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
  firefox = {
    imports = [
      homeModules.firefox
    ];
  };

  guangtao = {
    imports = [firefox brave];
  };
}
