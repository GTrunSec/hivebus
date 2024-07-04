nix run .\#nixosConfigurations.guangtao-o-desktop.config.system.build.disko
sudo nixos-install --flake .#guangtao-o-desktop --root /mnt
