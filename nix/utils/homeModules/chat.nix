{pkgs, ...}: {
  home.packages = with pkgs; [
    tdesktop
    zoom-us
    slack
  ];
}
