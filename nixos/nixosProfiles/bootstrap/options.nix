_: {lib, ...}: {
  options.hive.bootstrap = with lib; {
    minimal = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to use the minimal bootstrap";
    };
    full = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to use the full bootstrap";
    };
    systemd-boot = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to use systemd-boot";
    };
    systemd-initrd = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to use systemd-initrd";
    };
  };
}
