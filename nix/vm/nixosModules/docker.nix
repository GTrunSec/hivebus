{ pkgs, defaultUser, ... }:
{
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

  virtualisation.docker.enable = true;
  users.groups.docker.members = [ defaultUser ];
}
