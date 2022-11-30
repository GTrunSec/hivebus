{
  fmt = {
    description = "Formats all changed source files";
    content = ''
      treefmt $(git diff --name-only --cached)
    '';
  };
  desktop = {
    description = "Colmena build Guangtao Home Machine";
    content = ''
      colmena build --on guangtao-o-desktop
    '';
  };
  libvirtd_1 = {
    description = "Colmena build Guangtao Libvirtd Machine";
    content = ''
      colmena build --on guangtao-o-libvirtd-1
    '';
  };
}
