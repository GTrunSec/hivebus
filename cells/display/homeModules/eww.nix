{
  pkgs,
  config,
  lib,
  ...
}: let
  dependencies =
    (lib.optionals config.wayland.windowManager.hyprland.enable [
      config.wayland.windowManager.hyprland.package
    ])
    ++ (with pkgs; [
      bash
      eww-wayland
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
    package = pkgs.eww-wayland;
  };
  # systemd.user.services.eww = {
  #   Unit = {
  #     Description = "Eww Daemon";
  #     # not yet implemented
  #     # PartOf = ["tray.target"];
  #     PartOf = ["hyprland-session.target"];
  #   };
  #   Service = {
  #     Environment = "PATH=/run/wrappers/bin:${l.makeBinPath dependencies}";
  #     ExecStart = "${eww}/bin/eww daemon --no-daemonize";
  #     Restart = "on-failure";
  #   };
  #   Install.WantedBy = ["hyprland-session.target"];
  # };
}
