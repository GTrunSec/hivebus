{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  inherit (cell.packages) styx;
  path = "${(std.incl self ["docs"])}/docs/styx";
  nixpkgs = inputs.nixpkgs.appendOverlays [
    (final: prev: {
      inherit styx;
    })
  ];
in {
  # hive = import "${path}/site.nix" {pkgs = nixpkgs;};
}
