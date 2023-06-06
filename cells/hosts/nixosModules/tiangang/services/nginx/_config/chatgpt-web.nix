{inputs}: {
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.cells.nixos.pops.exports.nixosProfiles.preset.services.chatgpt.web
  ];
  age.secrets.chatgpt-web.file = pkgs.lib.age.file "tiangang/chatgpt-web.age";
  age.secrets.chatgpt-web.mode = "0444";
  age.secrets.chatgpt-web-passwd.file = pkgs.lib.age.file "tiangang/chatgpt-web-passwd.age";
  age.secrets.chatgpt-web-passwd.mode = "0444";

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
