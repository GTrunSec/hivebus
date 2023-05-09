{
  inputs,
  cell,
}: {
  imports = [
    inputs.cells.bootstrap.nixosModules.zswap
    cell.nixosModules.desktop
    cell.hardwareProfiles.desktop
  ];
  networking.hostName = "Desktop";
  time.timeZone = "America/Los_Angeles";

  networking.firewall = {
    allowedTCPPorts = [8888 8889];
    allowedUDPPorts = [8888 8889];
  };
  networking.firewall.extraCommands = ''
    # iptables -t nat -A PREROUTING -i eno1 -p tcp --dport 443 -j REDIRECT --to-port 8080
    # iptables -t nat -A PREROUTING -i eno1 -p tcp --dport 80 -j REDIRECT --to-port 8080
  '';
  # sudo lsblk -o name,mountpoint,label,size,uuid
}
