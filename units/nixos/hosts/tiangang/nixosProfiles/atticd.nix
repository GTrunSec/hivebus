{config, inputs}:
{
  imports = [inputs.self.nixosModules.services.atticd];
  age.secrets.attic-cert.file = inputs.local.age.file "tiangang/attic-cert.age";
  environment.systemPackages = [inputs.attic.packages.attic];
  services.atticd = {
    enable = true;
    credentialsFile = config.age.secrets."attic-cert".path;
    package = inputs.attic.packages.attic-server;
    __profiles__ = {
      psql = true;
    };
    settings = {
      listen = "[::1]:57448";
      database.url = "postgresql:///atticd?host=/run/postgresql";
      allowed-hosts = ["attic.zhangguangtao.org"];
      api-endpoint = "https://attic.zhangguangtao.org/";
      storage = {
        type = "s3";
        region = "us-west-004";
        bucket = "guangtao-nix-cache";
        endpoint = "https://s3.us-west-004.backblazeb2.com";
      };
    };
  };
}
