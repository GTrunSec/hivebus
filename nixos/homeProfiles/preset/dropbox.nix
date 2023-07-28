_: {pkgs, ...}: {
  # FIXME: dropox missing module named 'gi'  https://github.com/NixOS/nixpkgs/issues/235345
  systemd.user.services.maestral = {
    Install.wantedBy = ["default.target"];
    serviceConfig.ExecStart = "${pkgs.maestral}/bin/maestral start --foreground";
  };
  home.packages = [pkgs.maestral-gui pkgs.maestral];
  # services.dropbox = {
  #   enable = true;
  # };
}
