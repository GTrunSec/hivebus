{
  config,
  lib,
  pkgs,
  ...
}: {
  services.xserver = {
    videoDrivers = ["nvidia" "intel"];
  };

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  hardware.nvidia.modesetting.enable = true;

  # hardware.nvidia.powerManagement.enable = true;
  # hardware.nvidia.prime = {
  #   nvidiaBusId = "PCI:1:0:0";
  #   intelBusId = "PCI:0:2:0";
  #   offload.enable = true;
  # };

  systemd.services.nvidia-control-devices = {
    wantedBy = [
      "multi-user.target"
    ];
  };

  boot.blacklistedKernelModules = ["nouveau"];
}
