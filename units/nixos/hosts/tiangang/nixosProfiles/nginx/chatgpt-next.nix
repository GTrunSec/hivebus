{
  pkgs,
  config,
  lib,
  inputs,
}:
let
  cfg = config.services.chatgpt-next-web;
in
{
  age.secrets.chatgpt-web.file = inputs.local.age.file "tiangang/chatgpt-web.age";
  age.secrets.chatgpt-web.mode = "0444";
  age.secrets.chatgpt-web-passwd.file = inputs.local.age.file "tiangang/chatgpt-web-passwd.age";
  age.secrets.chatgpt-web-passwd.mode = "0444";

  imports = [
    inputs.self.nixosModules.services.chatgpt-next-web
    {
      config.services.chatgpt-next-web = {
        enable = true;
        port = 3010;
        envFile = config.age.secrets."chatgpt-next-web".path;
      };
    }
  ];

  age.secrets.chatgpt-next-web.file = inputs.local.age.file "tiangang/chatgpt-web-env.age";
  age.secrets.chatgpt-next-web.mode = "444";

  services.nginx = {
    virtualHosts = {
      "chatgpt.zhangguangtao.org" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString cfg.port}";
          recommendedProxySettings = true;
          extraConfig = ''
            auth_basic "ChatGPT-web password";
            auth_basic_user_file ${config.age.secrets.chatgpt-web-passwd.path};
            proxy_read_timeout 1800s;
            proxy_connect_timeout 1600s;
            access_log off;
            proxy_cache off;
            proxy_buffering off;
            chunked_transfer_encoding on;
            tcp_nopush on;  # Turn on TCP NOPUSH option, disable Nagle algorithm
            tcp_nodelay on;  # Turn on TCP NODELAY option, disable delay ACK algorithm
          '';
        };
        # FIXME: https://github.com/Yidadaa/ChatGPT-Next-Web/issues/1339
        locations."/api" = {
          proxyPass = "http://127.0.0.1:${toString cfg.port}/api";
          recommendedProxySettings = true;
          extraConfig = ''
            # suppressing the Authorization header
            proxy_set_header Authorization "";
            proxy_set_header X-Forwarded-User $remote_user;
          '';
        };
      };
    };
  };
}
