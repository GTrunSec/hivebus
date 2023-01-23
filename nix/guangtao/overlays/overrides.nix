{
  inputs,
  cell,
}: final: prev: {
  inherit
    (inputs.nixpkgs-master.legacyPackages.${prev.stdenv.system})
    gnome-remote-desktop
    bibata-cursors
    ;
}
