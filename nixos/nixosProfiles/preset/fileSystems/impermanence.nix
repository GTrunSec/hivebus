{ __inputs__ }:
{
  imports = [ __inputs__.impermanence.nixosModules.impermanence ];
  environment.persistence."/persist" = {
    directories = [
      "/var"
      "/root"
    ];
    files = [ "/etc/machine-id" ];
  };
}
