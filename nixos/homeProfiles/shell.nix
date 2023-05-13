{
  root,
  self,
  lib,
  pkgs',
}: let
  inherit (root) preset;
in {
  default = [
    preset.git.default
    preset.direnv
    preset.spell-check
    preset.tmux
    preset.latex
    preset.fzf
    preset.zoxide
    preset.zsh.default
    # preset.alacritty
    preset.dircolors.default
    preset.starship.default
    preset.gh
    preset.broot
    preset.atuin
    preset.bat.default
    preset.bat.catppuccin-mocha
    preset.navi.default
    {
      programs.btop.enable = true;
      programs.bat.enable = true;
      programs.jq.enable = true;
    }
    (lib.optional pkgs'.stdenv.isDarwin preset.wezterm.default)
    (lib.optional pkgs'.stdenv.isLinux preset.alacritty)
  ];

  users.guangtao = [
    preset.navi.guangtao
    preset.git.guangtao
  ];

  minimal = [
    preset.git.default
  ];

  full = [
    self.default
    self.minimal
  ];
}
