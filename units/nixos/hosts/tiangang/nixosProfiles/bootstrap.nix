{
  super,
  omnibus,
  inputs,
  pkgs,
}:
{
  imports = [ omnibus.nixosModules.omnibus.bootstrap ];

  system.stateVersion = "23.11";

  time.timeZone = "America/Los_Angeles";

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
