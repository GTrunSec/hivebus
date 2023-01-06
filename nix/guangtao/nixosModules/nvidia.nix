{
  config,
  lib,
  pkgs,
  ...
}: {
  services.xserver = {
    videoDrivers = ["nvidia" "intel"];
  };

  systemd.services.nvidia-control-devices = {
    wantedBy = [
      "multi-user.target"
    ];
  };
  boot = {
    kernelParams = ["nvidia-drm.modeset=1"];
    kernelModules = ["nvidia"];
    # blacklistedKernelModules = ["nouveau"];
  };
  hardware = {
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    # nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
    # nvidia = {
    #   package = config.boot.kernelPackages.nvidiaPackages.stable;
    #   open = true;
    #   nvidiaSettings = false;
    # };
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    nvidia.modesetting.enable = true;
    nvidia.powerManagement.enable = true;
    # nvidia.prime = {
    #   nvidiaBusId = "PCI:1:0:0";
    #   intelBusId = "PCI:0:2:0";
    #   offload.enable = true;
    # };
  };
}
