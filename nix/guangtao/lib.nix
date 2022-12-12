{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.nixpkgs.appendOverlays ([
    ]
    ++ l.attrValues cell.overlays.profiles);
in {
  inherit nixpkgs;

  mkHome = user: host: version: {
    imports =
      [
        {
          home-manager.users.${user} = {
            inherit (cell.homeConfigurations."${host}") imports;
            home.stateVersion = version;
          };
        }
      ]
      ++ l.optionals nixpkgs.stdenv.isLinux [
        cell.userProfiles.${user}
      ];
  };
}
