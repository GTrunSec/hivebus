_: {
  pkgs,
  config,
  ...
}: let
  src = pkgs.nixpkgs-hardenedlinux-sources.go-chatgpt-web.src.outPath;
in {
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
        ${pkgs.go-chatgpt-web}/bin/chatgpt-web
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
