{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in
  __mapAttrs (_: std.lib.dev.mkArion) {
    full-nixos = cell.arionProfiles.webapp;
  }
