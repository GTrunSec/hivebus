{
  config,
  pkgs,
  lib,
  super,
}:
{
  imports = [ super.desktop ];
  config = with lib; mkMerge [ ({ programs.emacs = { }; }) ];
}
