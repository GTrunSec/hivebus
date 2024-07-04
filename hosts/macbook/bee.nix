{
  inputs,
  self,
  lib,
}:
{
  system = "aarch64-darwin";
  darwin = inputs.darwin;
  home = inputs.home;
  pkgs = import inputs.darwin-nixos-unstable {
    inherit (self) system;
    config = {
      allowUnfreePredicate =
        pkg: builtins.elem (lib.getName pkg) [ "aspell-dict-en-science" ];
      permittedInsecurePackages = [ ];
    };
    overlays = [ (_: prev: { d2 = prev.emptyDirectory; }) ];
  };
}
