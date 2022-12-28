{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in {
  guangtao.users.users."${l.baseNameOf ./.}" = {
    password = "nixos";
    description = "default";
    isNormalUser = true;
    extraGroups = ["wheel"];
    inherit (cell.secretProfiles.guangtao) openssh;
  };

  gtrun = cell.userProfiles.guangtao;

  root.users.users."root" = {
    passowrd = "$6$iv9bE8EVny10wamj$CS7uxN8/QeLSIMKZGwN2X2OHKSIY8xxCDrXVkwKokPW4xMGdFGuQ6SSC8UJ9GcUFX2BQizE6k3yv8vUFyH2XA/";
    inherit (cell.secretProfiles.guangtao) openssh;
  };

  admin.users.users."admin" = {
    uid = 1000;
    description = "default manager";
    isNormalUser = true;
    extraGroups = ["wheel"];
    inherit (cell.secretProfiles.guangtao) openssh;
  };
}
