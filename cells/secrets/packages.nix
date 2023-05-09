{
  inputs,
  cell,
}: let
  nixpkgs = inputs.nixpkgs.appendOverlays [
    inputs.cells.common.lib.__inputs__.ragenix.overlays.default
  ];
in {
  # https://github.com/yaxitech/ragenix
  inherit (nixpkgs) ragenix;
}
