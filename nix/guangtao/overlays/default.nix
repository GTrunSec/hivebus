{
  inputs,
  cell,
}: final: prev: {
  guangtao-sources =
    (prev.callPackage ../packages/_sources/generated.nix {})
    // (
      prev.callPackage ../packages/emacs/_sources/generated.nix {}
    );
}
