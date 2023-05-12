{
  root,
  self,
  lib,
}: let
  inherit (root) preset;
in {
  nixos = [
    preset.chat
    preset.dropbox
  ];
  darwin = [];
}
