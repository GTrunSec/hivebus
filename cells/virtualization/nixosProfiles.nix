{
  inputs,
  cell,
}: {
  guangtao = {
    imports = [
      cell.nixosModules.libvirtd
      cell.nixosModules.libvirtd-packages
      cell.nixosModules.podman
      # cell.nixosModules.docker
      cell.nixosModules.test-container-nvidia
      ({
        config,
        lib,
        pkgs,
        ...
      }: {
        # virtualisation.docker.enable = false;

        users.users."guangtao" = {
          extraGroups =
            []
            ++ lib.optionals config.virtualisation.docker.enable ["docker"]
            ++ lib.optionals config.virtualisation.podman.enable ["podman"]
            ++ lib.optionals config.virtualisation.libvirtd.enable ["libvirtd"];
        };
        home-manager.users."guangtao" = {
          xdg.configFile = let
            podmanEnabled = config.virtualisation.podman.enable;
            podmanNvidiaEnabled = podmanEnabled && config.virtualisation.podman.enableNvidia;
          in
            lib.optionalAttrs (podmanNvidiaEnabled || config.virtualisation.docker.enableNvidia) {
              "nvidia-container-runtime/config.toml".source = "${pkgs.nvidia-podman}/etc/nvidia-container-runtime/config.toml";
            };
        };
      })
    ];
    users.extraUsers."guangtao".extraGroups = ["podman"];
    services.dockerRegistry.storagePath = "/DATABASE-4TB//docker-registry";

    virtualisation.podman.enableNvidia = true;
    virtualisation.docker.enableNvidia = true;
  };
}
