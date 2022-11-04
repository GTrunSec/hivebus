{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in {
  default.users.users."${l.baseNameOf ./.}" = {
    password = "nixos";
    description = "default";
    isNormalUser = true;
    extraGroups = ["wheel"];
    inherit (cell.secretProfiles.guangtao) openssh;
  };
}
