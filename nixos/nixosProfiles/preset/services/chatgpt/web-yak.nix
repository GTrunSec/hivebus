_:{
  pkgs,
  config,
  ...
}: let
in {
  age.secrets.chatgpt-yak.file = pkgs.lib.age.file "chatgpt-yak.age";
  age.secrets.chatgpt-yak.mode = "444";

  services.nginx = {
    enable = true;
    virtualHosts = {
      "yakgpt.zhangguangtao.org" = {
        useACMEHost = "zhangguangtao.org";
        # enableACME = true;
        forceSSL = true;
        extraConfig = ''
          auth_basic "ChatGPT-web password";
          auth_basic_user_file ${config.age.secrets.chatgpt-web-passwd.path};
          proxy_read_timeout 1800s;
          proxy_connect_timeout 1600s;
          access_log off;
        '';
        locations."/" = {
          proxyPass = "http://127.0.0.1:3005";
          recommendedProxySettings = true;
        };
      };
    };
  };
  systemd.services.chatgpt-yak = {
    description = "chatgpt-yak";
    wantedBy = ["network.target"];
    preStart = ''
      cp -rf --no-preserve=mode,ownership ${pkgs.yakgpt.outPath}/* /var/lib/chatgpt-yak/
      cp -rf --no-preserve=mode,ownership ${pkgs.yakgpt.outPath}/.next /var/lib/chatgpt-yak/.next
      chmod -R +x /var/lib/chatgpt-yak/node_modules/.bin/*
      cp -rf --no-preserve=mode,ownership ${config.age.secrets."chatgpt-yak".path} /var/lib/chatgpt-yak/.env.local
    '';
    script = ''
      export PATH=${pkgs.lib.makeBinPath [
        pkgs.nodejs
        pkgs.yarn
      ]}:/run/current-system/sw/bin:/var/lib/chatgpt-yak/node_modules/.bin:$PATH
      source .env.local && yarn start --hostname 127.0.0.1 --port 3005
    '';
    serviceConfig = {
      Type = "simple";
      ReadWritePaths = "/var/lib/chatgpt-yak";
      ProtectSystem = "strict";
      DynamicUser = true;
      Restart = "always";
      WorkingDirectory = "/var/lib/chatgpt-yak";
      StateDirectory = "chatgpt-yak";
    };
  };
}
