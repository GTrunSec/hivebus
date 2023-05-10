{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;
  # nixpkgs = inputs.nixpkgs.appendOverlays ([] ++ cell.overlays.desktop);
in {
  # inherit nixpkgs;
  mkHome = user: host: shell: {
    imports =
      [
        ({pkgs, ...}: {
          home-manager.users.${user} = {
            inherit (cell.homeConfigurations."${host}") imports;
            home.stateVersion = cell.nixosConfigurations.${host}.bee.pkgs.lib.trivial.release;
          };
          users.users.${user} = {
            shell = pkgs."${shell}";
          };
          programs.${shell}.enable = true;
        })
      ]
      ++ l.optionals (shell == "zsh") [{environment.pathsToLink = ["/share/zsh"];}]
      ++ l.optionals nixpkgs.stdenv.isLinux [
        inputs.cells.users.userProfiles.${user}
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
    imports = l.flatten cell.homeSuites.${host};
  };
}
