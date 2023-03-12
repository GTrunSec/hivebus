{
  inputs,
  cell,
}: {
  vultr = {
    lib,
    config,
    pkgs,
    ...
  }: let
    inherit (config.networking) hostName;
  in {
    imports = [
      inputs.cells.services.nixosProfiles.atticd.default
      ./acme.nix
      {
        age.secrets.attic-cert.file = pkgs.lib.age.file "attic-cert.age";
        services.atticd = {
          credentialsFile = config.age.secrets."attic-cert".path;
          settings = {
            listen = "[::1]:57448";
            database.url = "postgresql:///atticd";
            allowed-hosts = ["attic.zhangguangtao.org"];
            api-endpoint = "https://attic.zhangguangtao.org";
            storage = {
              type = "s3";
              region = "us-west-004";
              bucket = "guangtao-nix-cache";
              endpoint = "https://s3.us-west-004.backblazeb2.com";
            };
          };
        };
      }
    ];
    services.atticd.hiveProfiles = {
      psql = true;
    };
  };
}
