{
  config,
  pkgs,
  inputs,
}:
let
  inherit (inputs) nuScripts;
  configDir =
    if pkgs.stdenv.isDarwin then
      "Library/Application Support/nushell"
    else
      "${config.xdg.configHome}/nushell";
in
{
  home.packages = [pkgs.peco];
  programs.nushell = {
    enable = true;
    environmentVariables = {
      PATH = ''
        (
        $env.PATH
         | split row (char esep)
         | prepend $"/etc/profiles/per-user/($env.USER)/bin"
         | prepend "/run/current-system/sw/bin"
         | prepend "/opt/homebrew/bin"
         | prepend "/usr/local/bin"
        )
      '';
    };
    extraConfig = ''
      $env.config = {keybindings:[]}
      source ${nuScripts}/modules/prompt/async_git_prompt/prompt.nu

      alias cdghq = cd (fd -t d -d 4 '.git$' -HI ~/ghq -x dirname | sed "s|$(ghq root)/||" | peco)
    '';
  };
  home.file."${configDir}/async_git_prompt.nu".source =
    nuScripts + "/modules/prompt/async_git_prompt/async-git-prompt.nu";
}
