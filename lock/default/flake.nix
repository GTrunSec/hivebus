{
  description = "A very basic flake";

  inputs = {
    colmena.url = "github:zhaofengli/colmena";
  };

  inputs = {
    # https://github.com/DeterminateSystems/bootspec
    bootsec.url = "github:DeterminateSystems/bootspec";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: {};
}
