{...}: {
  hyprland = {
    programs.hyprland.enable = true;

    services.xserver.displayManager.defaultSession = "hyprland";
  };
}
