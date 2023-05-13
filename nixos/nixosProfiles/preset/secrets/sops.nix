{inputs}: {pkgs, ...}: let
  __inputs__ = inputs.cells.common.lib.__inputs__;
in {
  imports = [
    __inputs__.sops-nix.nixosModules.sops
  ];
}
