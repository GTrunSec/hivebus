{ inputs, cell }:
final: prev:
let
  packages = prev.callPackage ../packages/my-node-packages/plugins.nix { };
in
{
  nodePackages =
    prev.nodePackages
    // packages
    // {
      # https://github.com/NixOS/nixpkgs/issues/60057#issuecomment-505781308
      # mermaid-cli = packages."@mermaid-js/mermaid-cli".overrideAttrs (
    }
  ;
}
