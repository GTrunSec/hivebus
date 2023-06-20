{inputs}: {
  pkgs,
  config,
  lib,
  ...
}: let
in {
  imports = [
    inputs.cells.nixos.pops.exports.nixosModules.outputs.chatgpt-next-web
    {
      config.services.chatgpt-next-web = {
        enable = true;
        port = 3010;
        envFile = config.age.secrets."chatgpt-next-web".path;
      };
    }
  ];

  age.secrets.chatgpt-next-web.file = pkgs.lib.age.file "tiangang/chatgpt-web-env.age";
  age.secrets.chatgpt-next-web.mode = "444";

  services.nginx = {
    virtualHosts = {
      "chatgpt.zhangguangtao.org" = {
        enableACME = true;
        forceSSL = true;
        extraConfig = ''
          auth_basic "ChatGPT-web password";
          auth_basic_user_file ${config.age.secrets.chatgpt-web-passwd.path};
          proxy_read_timeout 1800s;
          proxy_connect_timeout 1600s;
          access_log off;
        '';
        locations."/" = {
          proxyPass = "http://127.0.0.1:3010";
          recommendedProxySettings = true;
        };
      };
    };
  };
}
