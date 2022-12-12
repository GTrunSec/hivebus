{
  inputs,
  cell,
}: {
  programs.fzf.enable = true;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };
  programs.gpg.enable = true;
  programs.jq.enable = true;
  programs.mcfly.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
