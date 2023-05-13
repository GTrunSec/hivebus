{
  inputs,
  cell,
}: let
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

    mkWaylandApp = t: e: f:
      prev.stdenv.mkDerivation {
        pname = t.pname or t.name + "-mkWaylandApp";
        inherit (t) version;
        unpackPhase = "true";
        doBuild = false;
        nativeBuildInputs = [prev.buildPackages.makeWrapper];
        installPhase = ''
          mkdir -p $out/bin
          ln -s "${prev.lib.getBin t}/bin/${e}" "$out/bin"
          ln -s "${prev.lib.getBin t}/share" "$out/share"
        '';
        postFixup = ''
          for e in $out/bin/*; do
            wrapProgram $e --add-flags ${prev.lib.escapeShellArg f}
          done
        '';
      };

    inherit
      (__inputs__.nixpkgs-hardenedlinux.packages)
      gptcommit
      ;

    nix-init = __inputs__.nix-init.packages.default;

    namaka = __inputs__.namaka.packages.default;

    nixUnstable = __inputs__.nix.packages.nix;

    mind-wave = final.poetry2nix.mkPoetryEnv {
      projectDir = ../packages/mind-wave;
    };

    # slurp = prev.slurp.overrideAttrs (_: {
    #   name = "slurp-PR-95";
    #   src = __utils__.slurp;
    # });

    lib = prev.lib.extend (lself: lsuper: {
      age.file = file: lsuper.path.append ../secretProfiles file;
    });
  }
