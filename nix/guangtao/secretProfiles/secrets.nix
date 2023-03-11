let
  keys = import ../secretProfiles.nix;
  common = [
    keys.guangtao.openssh-pub.desktop
    keys.guangtao.openssh-pub.macbook
  ];
  cloud = [
    keys.cloud.openssh-pub.vultr
  ];
in {
  "root-user.age".publicKeys =
    [
      keys.libvirtd.openssh-pub.home3
    ]
    ++ common;
  "attic-cert.age".publicKeys = common ++ cloud;
}
