{
  config,
  pkgs,
  inputs,
}:
{
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  networking.firewall.allowedUDPPorts = [ 443 ];
  users.users.nginx.group = "nginx";
  users.groups.nginx = { };
  users.users.nginx.isSystemUser = true;
  users.users.nginx.extraGroups = [ config.users.groups.acme.name ];

  services.nginx.enable = true;
}
