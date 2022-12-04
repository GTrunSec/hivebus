{
  inputs,
  cell,
}: let
  inherit (inputs) hivelib colmena;

  nixpkgs = inputs.nixos;
in {
  colmenaHive = cellBlock: self: let
    makeHoneyFrom = import "${hivelib}/make-honey.nix" {
      inherit nixpkgs cellBlock colmena;
    };
  in
    makeHoneyFrom self;

  nixosConfigurations = cellBlock: self: let
    makeMeadFrom = import "${hivelib}/make-mead.nix" {
      inherit nixpkgs cellBlock;
    };
  in
    makeMeadFrom self;

  darwinConfigurations = cellBlock: self: let
    makeDarwinFrom = import ./make-darwin.nix {
      inherit nixpkgs cellBlock;
      pasteurize' = "${hivelib}/pasteurize.nix";
      darwin = inputs.darwin;
    };
  in
    makeDarwinFrom self;

  homeConfigurations = cellBlock: self: let
    makeMoonshineFrom = import "${hivelib}/make-moonshine.nix" {
      inherit nixpkgs cellBlock;
    };
  in
    makeMoonshineFrom self;
}
