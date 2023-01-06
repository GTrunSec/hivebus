{
  inputs,
  cell,
}: let
  init = {
    pkgs,
    modulesPath,
    ...
  }: {
    ### root password is empty by default ###
    imports = [
      ./hardware-configuration.nix
    ];

    services.getty.autologinUser = "guangtao";

    system.stateVersion = "22.11";

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "America/Los_Angeles";

    # boot.kernelPackages = pkgs.linuxPackages_6_0.extend (_: super: {});

    # sudo cp -r ~/.gnupg /var/lib/sops
    # sops.gnupg.home = "/home/gtrun/.gnupg";

    networking.hostName = "Desktop";

    networking.firewall = {
      allowedTCPPorts = [8888 8889];
      allowedUDPPorts = [8888 8889];
    };

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
    overlays = cell.overlays.desktop;
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
