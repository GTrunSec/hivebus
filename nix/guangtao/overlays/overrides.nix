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
      onlyoffice-bin
      typst-lsp
      # darwin packages
    ;

    yabai = nixpkgs-master.yabai.overrideAttrs (old: rec {
      version = "5.0.3";
      src = prev.fetchzip {
        url = "https://github.com/koekeishiya/yabai/releases/download/v${version}/yabai-v${version}.tar.gz";
        sha256 = "sha256-dnUrdCbEN/M4RAr/GH3x10bfr2TUjuomxIUStFK7X9M=";
      };
    });

    python3Override = nixpkgs-master.python3;
  }
