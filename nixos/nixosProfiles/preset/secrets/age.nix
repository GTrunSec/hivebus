{__inputs__}: {pkgs, ...}: let
in {
  imports = [
    __inputs__.ragenix.nixosModules.age
  ];
  age.secretsDir = "/run/keys";
}
