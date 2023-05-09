{...}: {
  programs.git = {
    enable = true;
    delta.enable = true;
    lfs.enable = true;

    delta.options = {
      plus-style = "syntax #012800";
      minus-style = "syntax #340001";
      syntax-theme = "Monokai Extended";
      navigate = true;
    };

    extraConfig = {
      core.autocrlf = "input";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.enabled = true;
    };
  };
}
