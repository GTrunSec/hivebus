{
  inputs,
  cell,
}: {
  guangtao = {
    imports = [
      cell.nixosModules.libvirtd
      cell.nixosModules.libvirtd-packages
      cell.nixosModules.podman
    ];
    users.extraUsers."guangtao".extraGroups = ["podman"];
    services.dockerRegistry.storagePath = "/DATABASE-4TB//docker-registry";
    virtualisation.podman.enableNvidia = true;
  };
}
