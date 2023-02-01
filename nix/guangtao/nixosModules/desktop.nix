{
  config,
  pkgs,
  lib,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        services.printing.enable = true;
        services.gnome.gnome-keyring.enable = true;
        programs.nix-ld.enable = true;
        environment.systemPackages = with pkgs; [];
      }
    ];
}
