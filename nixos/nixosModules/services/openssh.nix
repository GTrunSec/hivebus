{
  enable = true;
  # copyright: https://github.com/numtide/srvos/blob/main/nixos/common/openssh.nix
  settings = {
    KbdInteractiveAuthentication = false;
    X11Forwarding = false;
    PasswordAuthentication = false;
    permitRootLogin = "yes";
    UseDns = false;
  };
  # unbind gnupg sockets if they exists
  extraConfig = "StreamLocalBindUnlink yes";
  # systemd.services.nix-daemon.environment.SSH_AUTH_SOCK = "/run/user/1000/ssh-XXXXXXUdcI9y/agent.1682306";
}
