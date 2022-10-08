{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  inherit (cell.packages) styx;
  styx-themes = import styx.themes;
  path = "${(std.incl self [(self + /docs/hive)])}//docs/hive";
  nixpkgs = inputs.nixpkgs.appendOverlays [
    (final: prev: {
      inherit styx;
    })
  ];
in {
  hive = import "${path}/site.nix" { pkgs = nixpkgs; };
}
