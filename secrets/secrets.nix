let
  flake = (__getFlake (__toPath ../.)).${__currentSystem};
  opensshKeys = flake.users.userProfiles.openssh;
  exports = flake.hosts.pops.exports;

  # Common keys for all hosts
  common = with opensshKeys; [desktop macbook];
  cloud = [exports.vultr.opensshKey];
in {
  "vultr/attic-cert.age".publicKeys = common ++ cloud;
  "vultr/acme-cloudflare.age".publicKeys = common ++ cloud;
  "vultr/chatgpt-web.age".publicKeys = common ++ cloud;
  "vultr/chatgpt-web-passwd.age".publicKeys = common ++ cloud;
  "vultr/chatgpt-yak.age".publicKeys = common ++ cloud;
  "vultr/v2ray-vmess.age".publicKeys = common ++ cloud;
}
