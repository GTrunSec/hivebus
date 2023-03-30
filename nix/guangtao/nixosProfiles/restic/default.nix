{
  inputs,
  cell,
}: {
  desktop = {
    imports = [inputs.cells.backup.nixosModules.restic];
    services.restic.server = {
      enable = true;
      dataDir = "/DATABASE-4TB/restic";
      appendOnly = true; # Prunes are done server-side, clients only add snapshots
      listenAddress = "127.0.0.1:6053";
      extraFlags = [
        # No need for HTTP authenticatio for now
        "--no-auth"
        # Use HTTPS
        # "--tls"
        # "--tls-cert"
        # "${sslCertDir}/cert.pem"
        # "--tls-key"
        # "${sslCertDir}/key.pem"
      ];
    };
  };
}
