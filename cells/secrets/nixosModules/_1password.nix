{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    _1password-gui
    _1password
  ];
}
