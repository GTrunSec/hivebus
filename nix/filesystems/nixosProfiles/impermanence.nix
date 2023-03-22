{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
in rec {
  default = {
    imports = [__inputs__.impermanence.nixosModules.impermanence];
    environment.persistence."/persist" = {
      directories = [
        "/var"
        "/root"
      ];
      files = [
        # "/etc/machine-id"
      ];
    };
  };
  guangtao = {
    imports = [
      default
    ];
    environment.persistence."/persist" = {
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
