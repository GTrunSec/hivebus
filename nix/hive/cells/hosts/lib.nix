{inputs, cell}:
let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;
in
# nixpkgs = inputs.nixpkgs.appendOverlays ([] ++ cell.overlays.desktop);
{
  # inherit nixpkgs;
  mkHome = user: host: shell: {
    imports =
      [
        (
          {pkgs, ...}:
          {
            home-manager.users.${user} = {
              inherit (cell.homeConfigurations."${host}") imports;
              home.stateVersion =
                if nixpkgs.stdenv.isDarwin then
                  cell.darwinConfigurations.${host}.bee.pkgs.lib.trivial.release
                else
                  "23.05";
            };
            users.users.${user} = {
              shell = pkgs."${shell}";
              home = if nixpkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";
            };
            programs.${shell}.enable = true;
          }
        )
      ]
      ++ l.optionals (shell == "zsh") [{environment.pathsToLink = ["/share/zsh"];}]
      ++
        l.optionals nixpkgs.stdenv.isLinux
          [
            # inputs.cells.users.userProfiles.${user}
            inputs.cells.users.nixosProfiles.${user}
          ];
  };

  # nixConfig = inputs.cells.bootstrap.lib.nixConfig.guangtao;
  nixConfig = {};

  mkHomeConfig = host: user: {
    bee =
      if nixpkgs.stdenv.isDarwin then
        cell.darwinConfigurations.${host}.bee
      else
        cell.nixosConfigurations.${host}.bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = "23.05";
      username = user;
    };
    imports = l.flatten cell.pops.exports.${host}.homeSuites;
  };

  mkNixOSHost = export: system: nixos: extra: home: {
    bee.system = system;
    bee.home = home;
    bee.pkgs = import nixos (
      {
        inherit system;
        overlays = l.flatten export.overlays;
      }
      // extra
    );
    imports = l.flatten export.imports;
  };
}
