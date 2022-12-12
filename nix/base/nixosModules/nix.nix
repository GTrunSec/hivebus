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
      allowed-users = ["@wheel"];
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      system-features = ["nixos-test" "benchmark" "big-parallel" "kvm"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
    extraOptions = ''
      # use-cgroups = true
      # auto-allocate-uids = true
      min-free = 536870912
      accept-flake-config = true
      keep-outputs = true
      keep-derivations = true
      fallback = true
      experimental-features = nix-command flakes recursive-nix
    '';
  };
}
