{
  fmt = {
    description = "Formats all changed source files";
    content = ''
      treefmt $(git diff --name-only --cached)
    '';
  };
  home = {
    description = "Colmena build Guangtao Home Machine";
    content = ''
      colmena build --on guangtao-o-home
    '';
  };
}
