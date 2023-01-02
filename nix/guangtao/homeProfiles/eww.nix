{
  inputs,
  cell,
}: {config, ...}: let
  inherit (inputs.cells.common.lib) __inputs__;
  inherit (inputs) nixpkgs std self;
  src = "${(std.incl self ["profiles/eww"])}/profiles/eww";

  eww = __inputs__.eww.packages.default;
  eww-wayland = __inputs__.eww.packages.eww-wayland;

  l = inputs.nixpkgs.lib // builtins;
in let
  dependencies =
    [
      eww
      eww-wayland
    ]
    ++ (with nixpkgs; [
      config.wayland.windowManager.hyprland.package
      bash
      bc
      blueberry
      bluez
      coreutils
      dbus
      dunst
      findutils
      gawk
      gnused
      gojq
      iwgtk
      jaq
      light
      networkmanager
      networkmanagerapplet
      pavucontrol
      playerctl
      procps
      pulseaudio
      ripgrep
      socat
      udev
      upower
      util-linux
      wget
      wireplumber
      wlogout
      wofi
    ]);
in {
  programs.eww = {
    enable = true;
    package = eww-wayland;
    configDir = src;
  };

  systemd.user.services.eww = {
    Unit = {
      Description = "Eww Daemon";
      # not yet implemented
      # PartOf = ["tray.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${l.makeBinPath dependencies}";
      ExecStart = "${eww}/bin/eww daemon --no-daemonize";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
