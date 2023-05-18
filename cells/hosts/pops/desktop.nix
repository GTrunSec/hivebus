{
  self',
  cell,
  inputs,
  self,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.nixos.pops) exports;
in {
  imports = [
    self'.exports.nixosModules.desktop
    (cell.lib.mkHome "guangtao" "desktop" "zsh")

    inputs.cells.users.nixosProfiles.root
    self.nixosSuites
  ];

  overlays = self'.exports.overlays.desktop;

  nixosSuites = [
    exports.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    exports.nixosProfiles.preset.secrets.age

    (l.attrValues exports.nixosProfiles.preset.bootstrap)
    exports.nixosProfiles.preset.fileSystems.impermanence
    exports.nixosProfiles.preset.coding.rust
    exports.nixosProfiles.preset.coding.python
    exports.nixosProfiles.preset.coding.nix
    exports.nixosProfiles.preset.coding.julia
    exports.nixosProfiles.preset.coding.nickel
    exports.nixosProfiles.preset.coding.vscode.default
    exports.nixosProfiles.preset.coding.languageServers

    exports.nixosProfiles.graphical.full
  ];

  homeSuites = [
    exports.homeModules.default
    exports.homeProfiles.shell.default

    exports.homeProfiles.graphical.wayland
    exports.homeProfiles.preset.kanshi.desktop
    exports.homeProfiles.preset.hyprland.desktop
    exports.homeProfiles.preset.waybar.desktop

    exports.homeProfiles.preset.emacs.doomemacs
    exports.homeProfiles.apps.linux
  ];

  opensshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLxc7EBr1Qi4M65O1KjXZf4bOBZMQ6YeDSFYzKzFan7 Desktop-guangtao-03-02-2023";
}
