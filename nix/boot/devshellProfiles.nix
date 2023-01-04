{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  secureboot = {
    commands = [
      {package = nixpkgs.sbctl;}
    ];
  };
}
