_:
{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  systemd.services.nvidia-control-devices = {
    wantedBy = [ "multi-user.target" ];
  };
  boot = {
    kernelParams = [ "nvidia-drm.modeset=1" ];
    kernelModules = [ "nvidia" ];
    # blacklistedKernelModules = ["nouveau"];
  };
  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.production;
      modesetting.enable = true;
      powerManagement.enable = false;
    };
    # nvidia = {
    #   package = config.boot.kernelPackages.nvidiaPackages.stable;
    #   open = true;
    #   nvidiaSettings = false;
    # };
    opengl.enable = true;
    # nvidia.prime = {
    #   nvidiaBusId = "PCI:1:0:0";
    #   intelBusId = "PCI:0:2:0";
    #   offload.enable = true;
    # };
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    vulkan-tools
    glmark2
  ];
}
