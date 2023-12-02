{super, omnibus}:
{
  imports = [
    omnibus.nixosProfiles.presets.boot
    omnibus.nixosModules.omnibus.bootstrap
    super.disko
  ];

  boot.__profiles__.systemd-boot.enable = true;

  omnibus.bootstrap = {
    contabo = true;
    minimal = true;
  };
}
