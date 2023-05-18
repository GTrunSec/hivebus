{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.common.lib) __inputs__;
in {
  default = final: prev: {
    vscode-sources = import ../packages/vscode/_sources/generated.nix {
      inherit (inputs.nixpkgs) fetchgit fetchurl fetchFromGitHub dockerTools;
    };
    vscode-extensions =
      prev.lib.recursiveUpdate prev.vscode-extensions
      (final.lib.vscode-utils.builders.with-namespace {
        srcs = final.vscode-sources;
      });
  };
  vscode-extensions = __inputs__.devos-ext-lib.vscode-extensions.overlays.vscode-extensions;
}
