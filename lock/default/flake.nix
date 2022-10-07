{
  description = "A very basic flake";

  inputs = {
    colmena.url = "github:zhaofengli/colmena";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: {};
}
