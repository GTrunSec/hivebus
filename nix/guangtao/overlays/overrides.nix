{
  inputs,
  cell,
}: final: prev: {
  bibata-cursors = inputs.nixpkgs-master.legacyPackages.${prev.stdenv.system}.bibata-cursors;
}
