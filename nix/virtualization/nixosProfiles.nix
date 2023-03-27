{
  inputs,
  cell,
}: {
  guangtao = {
    imports = [
      cell.nixosModules.libvirtd
      cell.nixosModules.libvirtd-packages
      cell.nixosModules.podman
      cell.nixosModules.test-container-nvidia
      ({
        config,
        lib,
        pkgs,
        ...
      }: {
        users.users."guangtao" = {
          extraGroups =
            []
            ++ lib.optionals config.virtualisation.docker.enable ["docker"]
            ++ lib.optionals config.virtualisation.podman.enable ["podman"];
        };
        home-manager.users."guangtao" = {
          xdg.configFile = let
            podmanEnabled = config.virtualisation.podman.enable;
            podmanNvidiaEnabled = podmanEnabled && config.virtualisation.podman.enableNvidia;
          in
            lib.optionalAttrs podmanNvidiaEnabled {
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
