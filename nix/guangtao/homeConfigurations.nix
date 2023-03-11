{
  inputs,
  cell,
}: {
  desktop = {
    inherit (cell.nixosConfigurations.desktop) bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = cell.nixosConfigurations.desktop.bee.pkgs.lib.trivial.release;
      username = "guangtao";
    };
    imports = cell.homeSuites.desktop;
  };
  libvirtd_1 = {
    inherit (cell.nixosConfigurations.libvirtd_1) bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = cell.nixosConfigurations.libvirtd_1.bee.pkgs.lib.trivial.release;
      username = "admin";
    };
    imports = cell.homeSuites.libvirtd;
  };

  macbook = {
    inherit (cell.darwinConfigurations.macbook) bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = cell.nixosConfigurations.macbook.bee.pkgs.lib.trivial.release;
      username = "guangtao";
    };
    imports = cell.homeSuites.macbook;
  };

  vultr = {
    inherit (cell.nixosConfigurations.vultr) bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = cell.nixosConfigurations.vultr.bee.pkgs.lib.trivial.release;
      username = "admin";
    };
    imports = [];
  };
}
