let
  flake = (__getFlake (__toPath ../.)).${__currentSystem};
  # opensshKeys = flake.users.userProfiles.openssh;
  exports = flake.hosts.pops.exports;

  # Common keys for all hosts
  common = [
    exports.desktop.opensshPublicKey
    exports.macbook.opensshPublicKey
  ];
  cloud = [exports.tiangang.opensshPublicKey];
in {
  "tiangang/attic-cert.age".publicKeys = common ++ cloud;
  "tiangang/acme-cloudflare.age".publicKeys = common ++ cloud;
  "tiangang/chatgpt-web.age".publicKeys = common ++ cloud;
  "tiangang/chatgpt-web-passwd.age".publicKeys = common ++ cloud;
  "tiangang/chatgpt-yak.age".publicKeys = common ++ cloud;
  "tiangang/v2ray-vmess.age".publicKeys = common ++ cloud;
}
