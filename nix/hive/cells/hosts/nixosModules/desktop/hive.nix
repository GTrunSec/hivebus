{lib}:
{
  _imports = [{powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";}];
  bootstrap = {
    full = true;
    systemd-initrd = true;
  };
  display = {
    wayland = true;
  };
}
