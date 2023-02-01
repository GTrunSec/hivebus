{
  inputs,
  cell,
}: {
  vscode.guangtao = {
    imports = [
      cell.nixosModules.vscode
    ];
    programs.vscode.hiveProfiles = {
      rust = false;
      julia = true;
      nickel = true;
      markdown = true;
      bpmn = true;
    };
  };
}
