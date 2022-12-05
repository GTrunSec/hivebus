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
