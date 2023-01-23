{
  inputs,
  cell,
}: rec {
  default = {
    imports = [inputs.impermanence.nixosModules.impermanence];
  };
  guangtao = {
    imports = [
      default
    ];
    environment.persistence."/persist" = {
      directories = [
        "/var"
      ];
      files = [
        # "/etc/machine-id"
      ];
      users.guangtao = {
        directories = [
          "Documents"
          "Downloads"
          "Pictures"
          "ghq"
          ".cache"
          ".local"
          ".ssh"
          ".config/fcitx5"
        ];
      };
    };
  };
}
