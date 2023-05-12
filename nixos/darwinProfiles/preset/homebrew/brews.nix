{
  self,
  lib,
}:
lib.mapAttrs (name: value: {
  homebrew.casks = value;
}) {
  default = [
    "fontconfig"
    "coreutils"
    "rxvt-unicode"
    "libtool"
  ];
  apps = [
    "emacs-plus@30"
    # spell check
    "enchant"
  ];
}
