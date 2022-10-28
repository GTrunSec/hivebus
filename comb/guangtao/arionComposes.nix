{
  inputs,
  cell,
}: {
  full-nixos = {
    bee.system = "x86_64-linux";
    bee.pkgs = inputs.nixos.legacyPackages;
    modules = [
      cell.arionProfiles.webapp
    ];
  };
}
