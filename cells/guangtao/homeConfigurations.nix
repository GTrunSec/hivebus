{
  inputs,
  cell,
}: {
  desktop = cell.lib.mkHomeConfig "desktop" "guangtao";

  libvirtd_1 = cell.lib.mkHomeConfig "libvirtd_1" "admin";

  macbook = cell.lib.mkHomeConfig "macbook" "guangtao";

  vultr = cell.lib.mkHomeConfig "vultr" "admin";
}
