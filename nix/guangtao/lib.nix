{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  nixpkgs = inputs.nixpkgs.appendOverlays ([] ++ cell.overlays.desktop);
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
      ]
      ++ l.optionals (shell == "zsh") [{environment.pathsToLink = ["/share/zsh"];}]
      ++ l.optionals nixpkgs.stdenv.isLinux [
        cell.userProfiles.${user}
      ];
  };

  # nixConfig = inputs.cells.bootstrap.lib.nixConfig.guangtao;
  nixConfig = {};

  mkHomeConfig = host: user: {
    bee =
      if nixpkgs.stdenv.isDarwin
      then cell.darwinConfigurations.${host}.bee
      else cell.nixosConfigurations.${host}.bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = cell.nixosConfigurations.${host}.bee.pkgs.lib.trivial.release;
      username = user;
    };
    imports = cell.homeSuites.${host};
  };
  a =
    l.foldl' (
      acc: e:
        if l.elem e.name acc.visited
        then acc
        else {
          visited = acc.visited ++ [e.name];
          result = acc.result ++ [e];
        }
    ) {
      visited = [];
      result = [];
    };
}
