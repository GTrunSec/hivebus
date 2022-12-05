{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacsPgtkNativeComp;
    extraPackages = epkgs:
      with epkgs; [
        vterm
        grab-x-link
      ];
  };
  services.emacs.client.enable = true;
}
