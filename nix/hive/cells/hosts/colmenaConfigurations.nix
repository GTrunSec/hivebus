{ inputs, cell }:
let
  l = inputs.nixpkgs.lib // builtins;
in
{
  desktop = {
    deployment = {
      allowLocalDeployment = true;
      targetHost = "127.0.0.1";
    };
    inherit (cell.nixosConfigurations.desktop) bee imports;
  };
  tiangang = {
    deployment = {
      targetHost = "207.244.228.125";
      targetPort = 22;
      targetUser = "root";
      # sshOPTS
      # sshOptions = ["-o" "UserKnownHostsFile=/dev/null" "-o" "StrictHostKeyChecking=no"];
    };
    inherit (inputs.hivebus.src.hosts.tiangang.layouts.hive) bee imports;
  };

  macbook = {
    deployment = {
      allowLocalDeployment = true;
      targetHost = "127.0.0.1";
    };
    inherit (cell.darwinConfigurations.macbook) bee imports;
  };
}
