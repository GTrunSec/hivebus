{
  config,
  pkgs,
  ...
}: let
  inherit (config.networking) hostName;
in {
  age.secrets.acme-cloudflare.file = pkgs.lib.age.file "acme-cloudflare.age";

  security.acme = {
    acceptTerms = true;
    defaults.email = "gtrunsec@hardenedlinux.org";
  };

  networking.firewall.allowedTCPPorts = [80 443];
  networking.firewall.allowedUDPPorts = [443];

  security.acme.certs."zhangguangtao.org" = {
    dnsProvider = "cloudflare";
    credentialsFile = config.age.secrets."acme-cloudflare".path;
    domain = "*.zhangguangtao.org";
    extraDomainNames = ["*.zhangguangtao.org"];
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    virtualHosts = {
      "attic.zhangguangtao.org" = {
        enableACME = true;
        forceSSL = true;
        http3 = false;
        http2 = false;
        kTLS = true;
        extraConfig = ''
          client_header_buffer_size 64k;
        '';
        locations."/" = {
          proxyPass = "http://[::1]:57448";
          recommendedProxySettings = true;
        };
      };
    };
    # virtualHosts."${hostName}.*" = {
    #   default = true;
    #   forceSSL = true;
    #   useACMEHost = "zhangguangtao.org";
    #   serverAliases = ["localhost.*"];
    # };
  };
  users.users.nginx.extraGroups = [config.users.groups.acme.name];
  # services.caddy = {
  #   enable = true;
  #   extraConfig = ''
  #     (baseConfig) {
  #       encode {
  #         gzip
  #         zstd
  #       }
  #     }
  #   '';
  # };
  # systemd.tmpfiles.rules = [
  #   "d '/var/lib/caddy' 0750 caddy acme - -"
  # ];
  # services.caddy.virtualHosts."attic.zhangguangtao.org" = {
  #   useACMEHost = "zhangguangtao.org";
  #   logFormat = lib.mkForce "";
  #   extraConfig = ''
  #     import baseConfig

  #     reverse_proxy http://[::1]:57448 {
  #       trusted_proxies private_ranges
  #     }
  #   '';
  # };
}
