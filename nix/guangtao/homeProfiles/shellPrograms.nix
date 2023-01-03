{
  inputs,
  cell,
}: {
  programs.fzf.enable = true;
  programs.gpg.enable = true;
  programs.jq.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
