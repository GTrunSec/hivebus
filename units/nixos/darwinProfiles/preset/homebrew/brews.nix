{ self, lib }:
lib.mapAttrs (name: value: { homebrew.brews = value; }) {
  default = [
    "fontconfig"
    "coreutils"
    "rxvt-unicode"
    "libtool"
  ];
  apps = [
    "emacs-plus@29"
    # spell check
    "enchant"
  ];
}
