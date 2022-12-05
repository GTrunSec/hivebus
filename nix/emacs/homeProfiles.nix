{
  inputs,
  cell,
}: {
  linux = {
    imports = [
      cell.homeModules.linux
      cell.homeModules.doom
    ];
  };
  darwin = {
    imports = [
      cell.homeModules.darwin
      cell.homeModules.doom
    ];
  };
}
