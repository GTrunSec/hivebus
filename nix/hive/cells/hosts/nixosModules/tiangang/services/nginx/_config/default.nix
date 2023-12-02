_:
{config, pkgs, ...}:
{
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  networking.firewall.allowedUDPPorts = [443];
  users.users.nginx.extraGroups = [config.users.groups.acme.name];
  age.secrets.chatgpt-web.file = pkgs.lib.age.file "tiangang/chatgpt-web.age";
  age.secrets.chatgpt-web.mode = "0444";
  age.secrets.chatgpt-web-passwd.file = pkgs.lib.age.file "tiangang/chatgpt-web-passwd.age";
  age.secrets.chatgpt-web-passwd.mode = "0444";
}
