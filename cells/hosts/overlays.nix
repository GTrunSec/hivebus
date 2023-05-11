inputs.flops.lib.configs.haumea.setInit {
  src = ./overlays;
  inputs = {
    inherit cell;
    inputs = removeAttrs inputs ["self"];
    exports = inputs.cells.nixos.pops.exports.overlays;
    inherit (inputs.cells.common.lib) __inputs__ __utils__;
  };
}
# {
#   desktop = [
#     cell.overlays.default
#     cell.overlays.python
#     cell.overlays.overrides
#     cell.overlays.nodePackages
#     __inputs__.nur.overlay
#     __inputs__.rust-overlay.overlays.default
#     __inputs__.nixpkgs-wayland.overlays.default
#     __inputs__.poetry2nix.overlay
#     __inputs__.typst.overlays.default
#     inputs.cells.emacs.overlays.emacs-overlay
#     inputs.cells.utils.overlays.vscode
#     inputs.cells.utils.overlays.vscode-extensions
#     __inputs__.julia2nix.overlays.default
#   ];
#   macbook = [
#     cell.overlays.default
#     cell.overlays.python
#     cell.overlays.overrides
#     cell.overlays.nodePackages
#     __inputs__.rust-overlay.overlays.default
#     inputs.cells.emacs.overlays.emacs-darwin
#   ];
#   libvirtd = [];
#   vultr = [
#     cell.overlays.default
#     __inputs__.nixpkgs-hardenedlinux.pkgs.overlays.default
#     __inputs__.nixpkgs-hardenedlinux.common.lib.__inputs__.nix-npm-buildpackage.overlays.default
#     __inputs__.nixpkgs-hardenedlinux.common.lib.__inputs__.gomod2nix.overlays.default
#     __inputs__.nixpkgs-hardenedlinux.common.lib.__inputs__.pnpm2nix.overlays.default
#   ];
# }
# // inputs.cells.common.lib.importRakeLeaves ./overlays {inherit inputs cell;}
