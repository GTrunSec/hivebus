{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg' = config.virtualisation.hive;
in {
  config = with lib;
    mkMerge [
      (mkIf (cfg'.user != "") {
        users.users."${cfg'.user}" = {
          extraGroups =
            []
            ++ lib.optionals config.virtualisation.docker.enable ["docker"]
            ++ lib.optionals config.virtualisation.podman.enable ["podman"]
            ++ lib.optionals config.virtualisation.libvirtd.enable ["libvirtd"];
        };
      })
      (mkIf cfg'.nvidia {
        # services.dockerRegistry.storagePath = "/DATABASE-4TB//docker-registry";
        virtualisation.podman.enableNvidia = mkIf config.virtualisation.podman.enable true;
        virtualisation.docker.enableNvidia = mkIf config.virtualisation.docker.enable true;
      })
    ];
  #   home-manager.users."guangtao" = {
  #     xdg.configFile = let
  #       podmanEnabled = config.virtualisation.podman.enable;
  #       podmanNvidiaEnabled = podmanEnabled && config.virtualisation.podman.enableNvidia;
  #     in
  #       lib.optionalAttrs (podmanNvidiaEnabled || config.virtualisation.docker.enableNvidia) {
  #         "nvidia-container-runtime/config.toml".source = "${pkgs.nvidia-podman}/etc/nvidia-container-runtime/config.toml";
  #       };
  #   };
  # })
}
