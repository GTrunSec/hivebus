{
  inputs,
  cell,
}: {
  default = {
    imports = [cell.homeModules.emacs];
  };
}
