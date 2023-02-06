{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kanshi
  ];
  services.kanshi = {
    enable = true;
    # systemdTarget = "graphical-session.target";
  };
}
