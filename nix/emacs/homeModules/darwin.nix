{pkgs, ...}: {
  # programs.emacs = {
  #   enable = true;
  #   package = pkgs.emacs;
  # };
  home.packages = [
    pkgs.emacs
  ];
}
