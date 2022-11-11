{
  inputs,
  cell,
}: let
  init = {pkgs, ...}: {
    ### root password is empty by default ###
    imports = [./hardware-configuration.nix];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    system.stateVersion = "22.05";

    ## ssd
    services.fstrim.enable = true;

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "America/Los_Angeles";

    # sudo cp -r ~/.gnupg /var/lib/sops
    # sops.gnupg.home = "/home/gtrun/.gnupg";

    networking.firewall = {
      allowedTCPPorts = [8888 8889];
      allowedUDPPorts = [8888 8889];
    };

    networking.nat.enable = true;

    networking.firewall.extraCommands = ''
      # iptables -t nat -A PREROUTING -i eno1 -p tcp --dport 443 -j REDIRECT --to-port 8080
      # iptables -t nat -A PREROUTING -i eno1 -p tcp --dport 80 -j REDIRECT --to-port 8080
    '';
  };
in rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = [];
  };
  imports =
    [
      bee.home.nixosModules.home-manager
      init
    ]
    ++ [
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ]
    ++ cell.nixosSuites.desktop;
}
