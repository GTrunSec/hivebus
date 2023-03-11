{
  inputs,
  cell,
}: {
  vultr = {
    imports = [
      inputs.cells.services.nixosProfiles.atticd.default
      ({
        lib,
        config,
        ...
      }: {
        age.secrets.attic-cert.file = ../secretProfiles/attic-cert.age;
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
        services.caddy.virtualHosts."attic.zhangguangtao.org" = {
          useACMEHost = "zhangguangtao.org";
          logFormat = lib.mkForce "";
          extraConfig = ''
            import baseConfig
            reverse_proxy http://[::1]:57448 {
              trusted_proxies private_ranges
            }
          '';
        };
      })
    ];
    services.atticd.hiveProfiles = {
      psql = true;
    };
  };
}
