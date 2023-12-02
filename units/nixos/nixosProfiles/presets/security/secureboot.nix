{inputs, cell}:
{user, path}:
{config, ...}:
{
  privateKeyFile = "${config.users.users.${user}.home}/${path}";
  publicKeyFile = "${config.users.users.${user}.home}/${path}";
}
