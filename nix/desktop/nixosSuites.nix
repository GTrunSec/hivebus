{
  inputs,
  cell,
}: {
  guangtao = [
    {services.getty.autologinUser = "guangtao";}
    cell.nixosModules.dbus
    cell.nixosModules.dconf
  ];
}
