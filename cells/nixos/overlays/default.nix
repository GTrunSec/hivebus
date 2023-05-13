_: final: prev: {
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
}
