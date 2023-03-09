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
      bibata-cursors
      zoom-us
      brave
      firefox
      ;
    python3Override = nixpkgs-master.python3;
  }
