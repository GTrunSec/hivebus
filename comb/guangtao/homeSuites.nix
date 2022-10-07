{
  inputs,
  cell,
}: let
  inherit (inputs.cells) guangtao;

  inherit (cell) homeProfiles;
in {
  shell = with homeProfiles; [
    guangtao.homeModules.alacritty
    alacritty
    bat
    broot
    direnv
    fzf
    gh
    git
    gpg
    jq
    mcfly
    packages
    starship
    zoxide
    zsh
  ];
}
