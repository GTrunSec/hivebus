{
  inputs,
  cell,
}: {
  guangtao = {
    imports = [
      cell.nixosModules.libvirtd
      cell.nixosModules.libvirtd-packages
    ];
  };
}
