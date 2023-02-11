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
