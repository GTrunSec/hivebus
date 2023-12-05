{
  super,
  omnibus,
  inputs,
}:
{
  imports = [omnibus.nixosModules.omnibus.bootstrap];

  system.stateVersion = "23.11";

  omnibus.bootstrap = {
    contabo = true;
    minimal = true;
  };
  # boot.loader = {
  #   timeout = 0;
  #   systemd-boot.enable = true;
  #   efi.canTouchEfiVariables = true;
  # };
  # fileSystems."/" = {device = "/dev/disk/by-label/nixos";};
}
