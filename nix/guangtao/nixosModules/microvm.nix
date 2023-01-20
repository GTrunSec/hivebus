{
  config,
  lib,
  pkgs,
  ...
}: {
  system.stateVersion = "22.11";

  users.users.root.password = "";

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  microvm.shares = [
    {
      # use "virtiofs" for MicroVMs that are started by systemd
      proto = "9p";
      tag = "ro-store";
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
    }
  ];
}
