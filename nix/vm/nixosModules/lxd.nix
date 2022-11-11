{ defaultUser, ... }:
{
  virtualisation.lxd = {
    enable = true;
  };
  users.groups.lxd.members = [ defaultUser ];
}
