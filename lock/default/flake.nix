{
  description = "A very basic flake";

  inputs = {
  };

  inputs = {
    # https://github.com/DeterminateSystems/bootspec
    bootsec.url = "github:DeterminateSystems/bootspec";
  };

  inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    ragenix.url = "github:yaxitech/ragenix";
  };

  outputs = {self, ...}: {};
}
