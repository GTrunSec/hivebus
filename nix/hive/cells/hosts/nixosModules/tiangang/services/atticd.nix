{ inputs, cell }:
let
  inherit (inputs.cells.common.lib) __inputs__;
in
{
  _imports = [
    inputs.cells.nixos.pops.exports.nixosModules.outputs.atticd
    # __inputs__.attic.nixosModules.atticd
    (
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        environment.systemPackages = [ __inputs__.attic.packages.attic ];
        age.secrets.attic-cert.file = pkgs.lib.age.file "tiangang/attic-cert.age";
        services.atticd = {
          credentialsFile = config.age.secrets."attic-cert".path;
          package = __inputs__.attic.packages.attic-server;
        };
      }
    )
  ];
  enable = true;
  settings = {
    listen = "[::1]:57448";
    database.url = "postgresql:///attic?host=/run/postgresql";
    allowed-hosts = [ "attic.zhangguangtao.org" ];
    api-endpoint = "https://attic.zhangguangtao.org/";
    storage = {
      type = "s3";
      region = "us-west-004";
      bucket = "guangtao-nix-cache";
      endpoint = "https://s3.us-west-004.backblazeb2.com";
    };
  };
  hive = {
    psql = true;
  };
}
