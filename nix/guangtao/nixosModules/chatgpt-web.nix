{
  pkgs,
  config,
  ...
}: let
  src = pkgs.nixpkgs-hardenedlinux-go-sources.chatgpt-web.src.outPath;
in {
  age.secrets.chatgpt-web.file = pkgs.lib.age.file "chatgpt-web.age";
  age.secrets.chatgpt-web.mode = "777";
  age.secrets.chatgpt-web-passwd.file = pkgs.lib.age.file "chatgpt-web-passwd.age";
  age.secrets.chatgpt-web-passwd.mode = "777";

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
          proxyPass = "http://127.0.0.1:57445";
          recommendedProxySettings = true;
        };
      };
    };
  };
  systemd.services.chatgpt-web = {
    description = "chatgpt-web";
    wantedBy = ["network.target"];
    preStart = ''
      ln -sfT ${src}/resources /var/lib/chatgpt-web/resources
      ln -sfT ${src}/static /var/lib/chatgpt-web/static
      cp -rf ${config.age.secrets."chatgpt-web".path} /var/lib/chatgpt-web/config.json
    '';
    serviceConfig = {
      ExecStart = ''
        ${pkgs.chatgpt-web}/bin/chatgpt-web
      '';
      ReadWritePaths = "/var/lib/chatgpt-web";
      ProtectSystem = "strict";
      DynamicUser = true;
      Restart = "always";
      DevicePolicy = "closed";
      NoNewPrivileges = true;
      WorkingDirectory = "/var/lib/chatgpt-web";
      StateDirectory = "chatgpt-web";
    };
  };
}
