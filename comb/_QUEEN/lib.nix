{
  inputs,
  cell,
}: let
  inherit (inputs) hivelib;

  nixpkgs = inputs.nixos;
in {
  colmenaHive = cellBlock: self: let
    makeHoneyFrom = import "${hivelib}/make-honey.nix" {
      inherit nixpkgs cellBlock;
    };
  in
    makeHoneyFrom self;

  nixosConfigurations = cellBlock: self: let
    makeMeadFrom = import "${hivelib}/make-mead.nix" {
      inherit nixpkgs cellBlock;
    };
  in
    makeMeadFrom self;

  homeConfigurations = cellBlock: self: let
    makeMoonshineFrom = import "${hivelib}/make-moonshine.nix" {
      inherit nixpkgs cellBlock;
    };
  in
    makeMoonshineFrom self;
}
