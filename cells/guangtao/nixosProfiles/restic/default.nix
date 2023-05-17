{
  inputs,
  cell,
}: {
  desktop = {config, ...}: {
    # imports = [inputs.cells.backup.nixosModules.restic];
    # services.restic.server = {
    #   enable = true;
    #   prometheus = config.services.prometheus.enable;
    #   dataDir = "/DATABASE-4TB/restic";
    #   appendOnly = true;
    #   listenAddress = "127.0.0.1:6053";
    #   extraFlags = [
    #     "--no-auth"
    #   ];
    # };
  };
}
