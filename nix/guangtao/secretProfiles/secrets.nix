let
  keys = import ../secretProfiles.nix;
in {
  "root-user.age".publicKeys = [
    keys.guangtao.openssl.desktop
    keys.libvirtd.openssl.home3
  ];
}
