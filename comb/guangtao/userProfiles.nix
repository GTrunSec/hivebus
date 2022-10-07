{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;

  default = l.baseNameOf ./.;
in {
  default.users.users."${default}" = {
    password = "nixos";
    description = "default";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
