{pkgs, ...}: {
  virtualisation.docker.enable = false;
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerSocket.enable = true;
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;

  environment.systemPackages = with pkgs; [
    docker-client
    docker-compose
  ];
}
