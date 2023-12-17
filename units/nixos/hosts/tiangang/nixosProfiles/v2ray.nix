{
  pkgs,
  config,
  inputs,
}:
{
  networking.firewall = {
    allowedTCPPorts = [ 8489 ];
    allowedUDPPorts = [ 8489 ];
  };
  age.secrets.v2ray-vmess = {
    file = inputs.local.age.file "tiangang/v2ray-vmess.age";
    mode = "0755";
  };
  services.v2ray = {
    enable = true;
    configFile = config.age.secrets.v2ray-vmess.path;
  };
}
