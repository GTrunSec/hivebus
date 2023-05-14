{config, ...}:{
  networking.firewall.allowedTCPPorts = [80 443];
  networking.firewall.allowedUDPPorts = [443];
  users.users.nginx.extraGroups = [config.users.groups.acme.name];
}
