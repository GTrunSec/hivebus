{ config, pkgs }:
{
  programs.nushell = {
    enable = true;
    environmentVariables = {
      PATH = ''
        (
        $env.PATH
         | split row (char esep)
         | prepend $"/etc/profiles/per-user/($env.USER)/bin"
         | prepend "/run/current-system/sw/bin/"
         | prepend "/opt/homebrew/bin"
         | prepend "/usr/local/bin"
        )
      '';
    };
    extraConfig = ''
      $env.config = {keybindings:[]}
    '';
  };
}
