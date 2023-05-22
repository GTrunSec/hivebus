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

    swww = prev.callPackage ../packages/swww.nix {};

    inherit (__inputs__.nickel.packages) nickel lsp-nls;

    inherit (__inputs__.nil.packages) nil;

    inherit
      (__inputs__.nixpkgs-hardenedlinux.packages)
      gptcommit
      ;

    nix-init = __inputs__.nix-init.packages.default;

    namaka = __inputs__.namaka.packages.default;

    nixUnstable = __inputs__.nix.packages.nix;
    # slurp = prev.slurp.overrideAttrs (_: {
    #   name = "slurp-PR-95";
    #   src = __utils__.slurp;
    # });
    nrepl = (
      prev.writeShellScriptBin "nrepl" ''
        export PATH=${prev.coreutils}/bin:${prev.nixUnstable}/bin:$PATH
        if [ -z "$1" ]; then
           nix repl --argstr host "$HOST" --argstr flakePath "$PRJ_ROOT" ${./__repl.nix}
         else
           nix repl --argstr host "$HOST" --argstr flakePath $(readlink -f $1 | sed 's|/flake.nix||') ${./__repl.nix}
         fi
      ''
    );
  }
