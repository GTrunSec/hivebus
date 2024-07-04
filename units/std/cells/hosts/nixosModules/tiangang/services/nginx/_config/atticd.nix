{
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
  };
}
