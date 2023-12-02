{lib, omnibus}:
{
  imports = [omnibus.darwinProfiles.presets.homebrew];
  homebrew = {
    __profiles__ = {
      enableReaders = lib.mkDefault true;
      enableShell = lib.mkDefault true;
      enableFonts = lib.mkDefault true;
      enableContainers = lib.mkDefault true;
      enableEmacs = lib.mkDefault true;
      enableChinese = lib.mkDefault true;
      enableSecurity = lib.mkDefault true;
      enableChat = lib.mkDefault true;
      casks.removePackagesFromProfiles = [];
      brews.removePackagesFromProfiles = [];
    };
  };
}
