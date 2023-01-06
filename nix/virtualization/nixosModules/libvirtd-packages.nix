{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.virt-manager
  ];
}
