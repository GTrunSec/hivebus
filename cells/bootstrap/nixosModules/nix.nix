{
  config,
  lib,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nixUnstable;
    optimise.automatic = true;
    nrBuildUsers = 0;
    settings = {
      nix-path = ["nixpkgs=${pkgs.path}"];
      allowed-users = ["@wheel"];
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      system-features = ["nixos-test" "benchmark" "big-parallel" "kvm"];
      builders-use-substitutes = true;
      keep-derivations = true;
      auto-allocate-uids = true;
      use-cgroups = true;
      experimental-features = ["nix-command" "flakes" "ca-derivations" "auto-allocate-uids" "cgroups"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
    extraOptions = ''
      min-free = 536870912
      accept-flake-config = true
      fallback = true
    '';
  };
}
