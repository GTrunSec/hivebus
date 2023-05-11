{inputs}: let
  inherit (inputs.cells.common.lib) __inputs__ __utils__;
in
  final: prev: {
    guangtao-sources =
      (prev.callPackage ../packages/_sources/generated.nix {})
      // (
        prev.callPackage ../packages/emacs/_sources/generated.nix {}
      );

    material-symbols = prev.callPackage ../packages/material-symbols.nix {};

    inherit (__inputs__.nickel.packages) nickel lsp-nls;

    inherit (__inputs__.nil.packages) nil;

    inherit
      (__inputs__.nixpkgs-hardenedlinux.packages)
      gptcommit
      ;

    nix-init = __inputs__.nix-init.packages.default;

    namaka = __inputs__.namaka.packages.default;

    # slurp = prev.slurp.overrideAttrs (_: {
    #   name = "slurp-PR-95";
    #   src = __utils__.slurp;
    # });
  }
