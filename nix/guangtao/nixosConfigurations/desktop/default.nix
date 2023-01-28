{
  inputs,
  cell,
}: rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = cell.overlays.desktop;
  };
  imports =
    [
      ./hardware-configuration.nix
    ]
    ++ cell.nixosSuites.desktop;
}
