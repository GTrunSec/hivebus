{
  lib,
}:
lib.mapAttrs (name: value: {
  homebrew.taps = value;
}){
  default = [
    "homebrew/cask-fonts"
    "homebrew/cask"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/bundle"
    "homebrew/core"
    "d12frosted/emacs-plus"
  ];
}
