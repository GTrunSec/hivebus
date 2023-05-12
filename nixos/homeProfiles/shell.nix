{
  root,
  self,
  lib,
}: let
  inherit (root) preset;
in {
  default = [
    preset.git
    preset.direnv
    preset.spell-check
    preset.tmux
    preset.latex
    preset.fzf
    preset.zoxide
    {
      programs.btop.enable = true;
      programs.bat.enable = true;
      programs.jq.enable = true;
    }
  ];

  minimal = [
    preset.git
  ];

  full =
    self.default
    ++ self.minimal;
}
