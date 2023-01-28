{
  inputs,
  cell,
}: let
  nixpkgs-master = import inputs.nixpkgs-master {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
  };
in
  final: prev: {
    inherit
      (nixpkgs-master)
      gnome-remote-desktop
      bibata-cursors
      zoom-us
      ;
  }
