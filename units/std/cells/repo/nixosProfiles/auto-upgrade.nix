{
  system.autoUpgrade = {
    enable = true;
    dates = "07:00";
    flake = "github:gtrunsec/hive";
    allowReboot = true;
    persistent = true;
  };
}
