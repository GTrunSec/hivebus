{
  config,
  pkgs,
  ...
}: {
  nix.nixPath = [
    (
      let
        sshConfigFile = pkgs.writeText "ssh_config" ''
          Host github.com
          IdentityFile /etc/ssh/ssh_host_rsa_key
          StrictHostKeyChecking=no
        '';
      in "ssh-config-file=${sshConfigFile}"
    )
  ];
}
