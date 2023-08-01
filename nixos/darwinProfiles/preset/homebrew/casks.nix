{ lib }:
lib.mapAttrs (name: value: { homebrew.casks = value; }) {
  default = [
    "font-fantasque-sans-mono"
    # Chinese inputs
    "squirrel"
  ];

  apps = [
    "amethyst"
    "wez/wezterm/wezterm-nightly"
    "dropbox"
    "grammarly-desktop"
    "secretive"
    "bartender"
  ];
  services = [ "docker" ];
  book = [
    "koodo-reader"
    # sudo xattr -rd com.apple.quarantine  /Applications/Koodo\ Reader.app
    "skim"
  ];
}
