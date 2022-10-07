{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
  inherit (inputs.cells) _QUEEN;

  inherit (cell.nixosProfiles) iog-patched-nix;
in
  builtins.mapAttrs (_QUEEN.lib.lay nixos.legacyPackages.x86_64-linux) {
    # ws = {
    # };
  }
