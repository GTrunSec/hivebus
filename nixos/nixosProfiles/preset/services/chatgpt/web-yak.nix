_:{
  pkgs,
  config,
  ...
}: let
in {
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
