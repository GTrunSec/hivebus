{
  config,
  lib,
  pkgs,
  ...
}: let
  l = lib // builtins;
  inherit (pkgs.stdenv.hostPlatform) isAarch64;
in {
  nix = {
    package = pkgs.nixUnstable;
    configureBuildUsers = true;
    settings = {
      # Administrative users on Darwin systems are part of the admin group.
      trusted-users = ["@admin"];
      extra-platforms = l.mkIf isAarch64 ["x86_64-darwin" "aarch64-darwin"];
    };
    extraOptions = ''
      auto-optimise-store = true
      # auto-allocate-uids = true
      experimental-features = nix-command flakes recursive-nix
    '';
  };
  services.nix-daemon.enable = true;
  # Recreate /run/current-system symlink after boot
  # services.activate-system.enable = true;
}
