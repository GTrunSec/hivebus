_:
{
  pkgs,
  config,
  lib,
  ...
}:
{
  virtualisation.docker.enable =
    lib.mkIf config.virtualisation.podman.dockerSocket.enable
      (lib.mkForce false);
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    autoPrune.enable = true;
    dockerSocket.enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.systemPackages = with pkgs; [
    podman-compose
    podman-tui
  ];
}
