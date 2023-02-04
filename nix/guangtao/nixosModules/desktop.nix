{
  config,
  pkgs,
  lib,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        services.printing.enable = true;
        programs.nix-ld.enable = true;
      }
    ];
}
