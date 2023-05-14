{
  lib,
  pkgs,
  config,
  ...
}: {
  age.secrets.chatgpt-web.file = pkgs.lib.age.file "vultr/chatgpt-web.age";
  age.secrets.chatgpt-web.mode = "0444";
  age.secrets.chatgpt-web-passwd.file = pkgs.lib.age.file "vultr/chatgpt-web-passwd.age";
  age.secrets.chatgpt-web-passwd.mode = "0444";

  networking.firewall.allowedTCPPorts = [80 443];
  networking.firewall.allowedUDPPorts = [443];

  users.users.nginx.extraGroups = [config.users.groups.acme.name];

  services.nginx = {
    virtualHosts = {
      "chatgpt.zhangguangtao.org" = {
        # enableACME = true;
        useACMEHost = "zhangguangtao.org";
        forceSSL = true;
        extraConfig = ''
          auth_basic "ChatGPT-web password";
          auth_basic_user_file ${config.age.secrets.chatgpt-web-passwd.path};
          proxy_read_timeout 1800s;
          proxy_connect_timeout 1600s;
          access_log off;
          sub_filter 'src="/' 'src="';
          sub_filter 'href="/' 'href="';
          sub_filter_types text/html;
          sub_filter_once off;
        '';
        locations."/" = {
          proxyPass = "http://127.0.0.1:57445";
          recommendedProxySettings = true;
        };
      };
    };
  };
}
