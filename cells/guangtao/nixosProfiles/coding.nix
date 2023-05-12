{
  inputs,
  cell,
}: rec {
  desktop = {
    imports = [
      cell.nixosModules.julia
      cell.nixosModules.python
      cell.nixosModules.rust
      inputs.cells.utils.nixosProfiles.vscode.guangtao
      languageServers
      ({pkgs, ...}: {
    # environment.variables.PLAYWRIGHT_BROWSERS_PATH = pkgs.playwright-driver.browsers.outPath;
        environment.systemPackages = with pkgs; [
          namaka
          nix-init
          nickel
          lsp-nls
          typst-dev
          gptcommit
          d2
          # pkgs.playwright-driver.browsers
          playwright
          dolphin
        ];
      })
    ];
  };
  languageServers = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      shellcheck
      yaml-language-server
      typst-lsp
    ];
  };
}
