{
  inputs,
  cell,
}: let
  inherit (inputs) nixos home;
in let
  version = "22.11";
in {
  destkop = {
    inherit (cell.nixosConfigurations.desktop) bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = version;
      username = "guangtao";
    };
    imports = cell.homeSuites.desktop;
  };
  libvirtd = {
    inherit (cell.nixosConfigurations.libvirtd) bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = version;
      username = "admin";
    };
    imports = cell.homeSuites.libvirtd;
  };
}
