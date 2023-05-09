{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    age.secrets.root-user.file = pkgs.lib.age.file "root-user.age";
    users.users.root = {
      passwordFile = config.age.secrets.root-user.path;
    };
  };
}
