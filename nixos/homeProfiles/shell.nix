{
  root,
  self,
  lib,
  pkgs',
}:
let
  inherit (root) preset;
in
{
  default = [
    self.minimal
    self.utils
    # ------------------------------
    preset.direnv
    preset.spell-check
    preset.tmux
    preset.latex
    preset.fzf
    preset.zoxide
    preset.zsh.default
    preset.dircolors.default
    preset.starship.default
    preset.gh
    preset.broot
    preset.atuin
    preset.bat.default
    preset.bat.catppuccin-mocha
    preset.navi
    (lib.optional pkgs'.stdenv.isDarwin preset.wezterm.default)
    (lib.optional pkgs'.stdenv.isLinux preset.alacritty)
  ];

  minimal = [ preset.git ];

  utils = [
    {
      programs.btop.enable = true;
      programs.bat.enable = true;
      programs.jq.enable = true;
    }
    preset.utils
  ];

  full = [ self.default ];
}
