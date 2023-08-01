_:
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nodePackages.bash-language-server
    nodePackages.typescript-language-server
    shellcheck
    yaml-language-server
    typst-lsp
  ];
}
