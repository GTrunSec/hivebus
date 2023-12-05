let
  flake = (__getFlake (__toPath ../..));
  # opensshKeys = flake.users.userProfiles.openssh;
  data = flake.local.${__currentSystem}.data;

  # Common keys for all hosts
  common = [
    data.guangtao.openssh.public.desktop
    data.guangtao.openssh.public.macbook
  ];
  cloud = [data.guangtao.openssh.public.tiangang];
in
{
  "tiangang/attic-cert.age".publicKeys = common ++ cloud;
  "tiangang/acme-cloudflare.age".publicKeys = common ++ cloud;
  "tiangang/chatgpt-web.age".publicKeys = common ++ cloud;
  "tiangang/chatgpt-web-passwd.age".publicKeys = common ++ cloud;
  "tiangang/chatgpt-web-env.age".publicKeys = common ++ cloud;
  "tiangang/chatgpt-yak.age".publicKeys = common ++ cloud;
  "tiangang/v2ray-vmess.age".publicKeys = common ++ cloud;
}
