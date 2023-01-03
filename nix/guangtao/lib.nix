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

  mkHome = user: host: shell: version: {
    imports =
      [
        ({pkgs, ...}: {
          home-manager.users.${user} = {
            inherit (cell.homeConfigurations."${host}") imports;
            home.stateVersion = version;
          };
          users.users.${user} = {
            shell = pkgs."${shell}";
          };
        })

      ] ++ l.optionals (shell == "zsh") [({environment.pathsToLink = ["/share/zsh"];})]
      ++ l.optionals nixpkgs.stdenv.isLinux [
        cell.userProfiles.${user}
      ];
  };

  nixConfig = inputs.cells.base.lib.nixConfig.guangtao;
}
