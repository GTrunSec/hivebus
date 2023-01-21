{...}: {
  services.openssh = {
    enable = true;
    settings = {
      kbdInteractiveAuthentication = false;
      passwordAuthentication = false;
      permitRootLogin = "yes";
    };
  };
  # systemd.services.nix-daemon.environment.SSH_AUTH_SOCK = "/run/user/1000/ssh-XXXXXXUdcI9y/agent.1682306";
}
