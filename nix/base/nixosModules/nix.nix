{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nixUnstable;
    gc.automatic = true;
    gc.options = "--max-freed $((10 * 1024 * 1024))";
    optimise.automatic = true;
    autoOptimiseStore = true;
    extraOptions = ''
      experimental-features = nix-command flakes recursive-nix
    '';
  };
}
