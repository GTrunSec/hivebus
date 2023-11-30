{
  lib,
  omnibus,
}:
{
  imports = [ omnibus.darwinProfiles.presets.homebrew ];
  homebrew = {
    __profiles__ = {
      readers = lib.mkDefault true;
      shell = lib.mkDefault true;
      fonts = lib.mkDefault true;
      containers = lib.mkDefault true;
      emacs = lib.mkDefault true;
      chinese = lib.mkDefault true;
      security = lib.mkDefault true;
      chat = lib.mkDefault true;
      casks.removePackagesFromProfiles = [ ];
      brews.removePackagesFromProfiles = [ ];
    };
  };
}
