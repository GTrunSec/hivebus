{inputs}: let
  openssh.authorizedKeys.keys = [
    inputs.cells.hosts.pops.exports.desktop.opensshPublicKey
    inputs.cells.hosts.pops.exports.macbook.opensshPublicKey
  ];
in {
  users.users."guangtao" = {
    uid = 1000;
    hashedPassword = "$6$iv9bE8EVny10wamj$CS7uxN8/QeLSIMKZGwN2X2OHKSIY8xxCDrXVkwKokPW4xMGdFGuQ6SSC8UJ9GcUFX2BQizE6k3yv8vUFyH2XA/";
    description = "Personal account";
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    inherit openssh;
  };
}
