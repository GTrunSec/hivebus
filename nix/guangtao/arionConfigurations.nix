{
  inputs,
  cell,
}: let
  inherit (inputs) std;
  l = inputs.nixpkgs.lib // builtins;
in {
  full-nixos = std.lib.dev.mkArion cell.arionProfiles.webapp;
}
