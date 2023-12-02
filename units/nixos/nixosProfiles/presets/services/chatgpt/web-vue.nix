_:
{pkgs, config, ...}:
let
in
{
  age.secrets.chatgpt-web.file = pkgs.lib.age.file "chatgpt-web.age";
  age.secrets.chatgpt-web.mode = "444";
  age.secrets.chatgpt-web-passwd.file = pkgs.lib.age.file "chatgpt-web-passwd.age";
  age.secrets.chatgpt-web-passwd.mode = "444";

  services.nginx = {
    enable = true;
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
          proxyPass = "http://127.0.0.1:3002";
          recommendedProxySettings = true;
        };
      };
    };
  };
  systemd.services.chatgpt-web = {
    description = "chatgpt-web";
    wantedBy = ["network.target"];
    preStart = ''
      cp -rf --no-preserve=mode,ownership ${pkgs.chatgpt-web}/* /var/lib/chatgpt-web/
      cp -rf ${config.age.secrets."chatgpt-web".path} /var/lib/chatgpt-web/.env
    '';
    script = ''
      export PATH=${
        pkgs.lib.makeBinPath [
          pkgs.nodejs.pkgs.pnpm
          pkgs.nodejs
          pkgs.vite
        ]
      }:/run/current-system/sw/bin:$PATH
      pnpm run prod
    '';
    serviceConfig = {
      Type = "simple";
      ReadWritePaths = "/var/lib/chatgpt-web";
      ProtectSystem = "strict";
      DynamicUser = true;
      Restart = "always";
      WorkingDirectory = "/var/lib/chatgpt-web";
      StateDirectory = "chatgpt-web";
    };
  };
}
