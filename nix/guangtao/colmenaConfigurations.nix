{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
  inherit (inputs.cells) _QUEEN;

  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = {
    deployment = {
      targetHost = "127.0.0.1";
      targetPort = 22;
      targetUser = "root";
      # sshOPTS
      # sshOptions = ["-o" "UserKnownHostsFile=/dev/null" "-o" "StrictHostKeyChecking=no"];
    };
    inherit (cell.nixosConfigurations.desktop) bee imports;
  };
  libvirtd_1 = {
    deployment = {
      targetHost = "192.168.122.212";
      targetPort = 22;
      targetUser = "root";
      # sshOPTS
      # sshOptions = ["-o" "UserKnownHostsFile=/dev/null" "-o" "StrictHostKeyChecking=no"];
    };
    inherit (cell.nixosConfigurations.libvirtd_1) bee imports;
  };
}
