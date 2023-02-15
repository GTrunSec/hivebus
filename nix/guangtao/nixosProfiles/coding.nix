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
        environment.systemPackages = with pkgs; [nickel];
      })
    ];
  };
  languageServers = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      shellcheck
      yaml-language-server
    ];
  };
}
