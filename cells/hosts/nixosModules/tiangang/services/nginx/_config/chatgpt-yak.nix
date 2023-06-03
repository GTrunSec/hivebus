{inputs}: {
  pkgs,
  config,
  ...
}: let
in {
  imports = [
    inputs.cells.nixos.pops.exports.nixosProfiles.preset.services.chatgpt.web-yak
  ];

  age.secrets.chatgpt-yak.file = pkgs.lib.age.file "tiangang/chatgpt-yak.age";
  age.secrets.chatgpt-yak.mode = "444";

  services.nginx = {
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
}
