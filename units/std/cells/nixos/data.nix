{ inputs, cell }:
let
  inherit (inputs.cells.common.lib.__utils__) navi-tldr-pages;
  inherit (inputs.nixpkgs.stdenv) isLinux isDarwin;
  l = inputs.nixpkgs.lib // builtins;
in
{
  navi-tldr-pages =
    with inputs.nix-filter.lib;
    filter {
      root = navi-tldr-pages + "/pages";
      exclude =
        [
          "android"
          "windows"
          "sunos"
          (if isLinux then "osx" else "linux")
          (
            root: path: type:
            if (l.match "[^/]*(rpm|yum|apt).*.cheat" (l.baseNameOf path)) == null then
              false
            else
              true
          )
        ]
        ++ l.optionals isDarwin [
          # (root: path: type: if (l.match "[^/]*brew.*\.cheat" (l.baseNameOf path)) == null then false else true)
        ];
    };
}
