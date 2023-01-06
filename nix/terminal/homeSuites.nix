{
  inputs,
  cell,
}: let
  inherit (cell) homeModules;
in {
  default = with homeModules;
    [
      zoxide
      fzf
      direnv
      dircolors
      tmux
      zsh
      starship
      atuin
      gh
      utils
      broot
    ]
    ++ [
      packages
    ];
  minimal = with homeModules; [
    tmux
    zsh
    starship
    atuin
    gh
  ];
}
