{ super, lib }:
{
  inherit (super) bee;
  imports = lib.flatten [ super.darwinSuites.default ];
}
