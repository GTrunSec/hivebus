{ inputs, config }:
{
  age.secrets.acme-cloudflare.file = inputs.local.age.file "tiangang/acme-cloudflare.age";
  security.acme = {
    acceptTerms = true;
    defaults.email = "gtrunsec@hardenedlinux.org";
  };
  security.acme.certs."zhangguangtao.org" = {
    dnsProvider = "cloudflare";
    credentialsFile = config.age.secrets."acme-cloudflare".path;
    domain = "*.zhangguangtao.org";
    extraDomainNames = [ "*.zhangguangtao.org" ];
  };
}
