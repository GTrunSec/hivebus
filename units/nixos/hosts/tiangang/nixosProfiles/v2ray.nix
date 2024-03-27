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
  services.nginx = {
    virtualHosts = {
      "proxy.zhangguangtao.org" = {
        enableACME = true;
        forceSSL = true;
        http3 = false;
        http2 = false;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8489";
          recommendedProxySettings = true;
          extraConfig = '''';
        };
      };
    };
  };
}
