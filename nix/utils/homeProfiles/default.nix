{
  inputs,
  cell,
}: {
  default = {
    programs.htop.enable = true;
    programs.bat.enable = true;
    # https://github.com/Canop/broot
    programs.broot = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
