{
  root,
  self,
  lib,
}: let
  inherit (root) preset;
in {
  default = [
    (lib.attrValues preset)
    {
      programs.btop.enable = true;
      programs.bat.enable = true;
      programs.jq.enable = true;
    }
  ];

  minimal = [
    preset.git
  ];

  full =
    self.default
    ++ self.minimal;
}
