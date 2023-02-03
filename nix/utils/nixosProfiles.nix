{
  inputs,
  cell,
}: {
  vscode.guangtao = {
    imports = [
      cell.nixosModules.vscode
    ];
    programs.vscode.hiveProfiles = {
      rust = true;
      julia = true;
      nickel = true;
      markdown = true;
      bpmn = true;
    };
  };
}
