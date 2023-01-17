{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib.__inputs__) devos-ext-lib;
in {
  vscode = {
    imports = [
      cell.nixosModules.vscode
    ];
  };
}
