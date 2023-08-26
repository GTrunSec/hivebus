{ inputs, cell }:
let
  inherit (cell.pops) exports;
in
{
  desktop =
    cell.lib.mkNixOSHost exports.desktop "x86_64-linux" inputs.nixos-unstable
      {
        config.allowUnfree = true;
        config.permittedInsecurePackages = [ "nodejs-16.20.2" ];
      }
      inputs.home;

  flops =
    cell.lib.mkNixOSHost exports.flops "x86_64-linux" inputs.nixos
      { config.allowUnfree = true; }
      inputs.home;

  tiangang =
    cell.lib.mkNixOSHost exports.tiangang "x86_64-linux" inputs.nixos { }
      inputs.home;

  init =
    cell.lib.mkNixOSHost exports.init "x86_64-linux" inputs.nixos { }
      inputs.home;
}
