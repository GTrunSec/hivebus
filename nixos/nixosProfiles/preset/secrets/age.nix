{inputs}: {pkgs, ...}: let
  __inputs__ = inputs.cells.common.lib.__inputs__;
in {
  imports = [
    __inputs__.ragenix.nixosModules.age
  ];
}
