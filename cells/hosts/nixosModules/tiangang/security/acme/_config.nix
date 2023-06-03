{
  config,
  pkgs,
  ...
}: {
  age.secrets.acme-cloudflare.file = pkgs.lib.age.file "tiangang/acme-cloudflare.age";

  security.acme.certs."zhangguangtao.org" = {
    dnsProvider = "cloudflare";
    credentialsFile = config.age.secrets."acme-cloudflare".path;
    domain = "*.zhangguangtao.org";
    extraDomainNames = ["*.zhangguangtao.org"];
  };
}
