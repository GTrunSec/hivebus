{
  config,
  pkgs,
  ...
}: {
  age.secrets.acme-cloudflare.file = pkgs.lib.age.file "vultr/acme-cloudflare.age";

  security.acme.certs."zhangguangtao.org" = {
    dnsProvider = "cloudflare";
    credentialsFile = config.age.secrets."acme-cloudflare".path;
    domain = "*.zhangguangtao.org";
    extraDomainNames = ["*.zhangguangtao.org"];
  };
}
