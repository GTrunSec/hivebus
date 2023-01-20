{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab.microvms.lib) makeVM;
in {
  dev = makeVM {
    channel = inputs.nixos.legacyPackages;
    module.imports = [cell.nixosModules.microvm cell.microvmProfiles.dev];
  };
}
