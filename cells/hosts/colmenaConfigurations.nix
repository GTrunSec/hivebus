{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = {
    deployment = {
      allowLocalDeployment = true;
      targetHost = "127.0.0.1";
    };
    inherit (cell.nixosConfigurations.desktop) bee imports;
  };
  vultr = {
    deployment = {
      targetHost = "149.28.65.143";
      targetPort = 22;
      targetUser = "root";
      # sshOPTS
      # sshOptions = ["-o" "UserKnownHostsFile=/dev/null" "-o" "StrictHostKeyChecking=no"];
    };
    inherit (cell.nixosConfigurations.vultr) bee imports;
  };
}
