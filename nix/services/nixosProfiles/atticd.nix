{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
in {
  default = {
    imports = [
      cell.nixosModules.atticd
      # __inputs__.attic.nixosModules.atticd
      ({
        pkgs,
        lib,
        ...
      }: {
        environment.systemPackages = [
          (pkgs.extend __inputs__.attic.overlays.default).attic
        ];
        services.atticd.package = (pkgs.extend __inputs__.attic.overlays.default).attic-server;
      })
    ];
    services.atticd = {
      enable = true;
    };
  };
}
