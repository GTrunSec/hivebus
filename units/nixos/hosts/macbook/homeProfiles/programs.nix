{
  inputs,
  lib,
  pkgs,
}:
let
  removeUnwantedPackages =
    pkg:
    lib.warn "the ${pkg.pname} has been removed on the  ${pkgs.system}" pkgs.emptyDirectory;
in
{
  # imports = [ inputs.self.pops.omnibus.homeProfiles.exports.macbook.presets.alacritty ];
  programs.zoxide = {
    enable = lib.mkForce false;
  };

  programs.starship = {
    enable = lib.mkForce false;
  };
  home.packages = [
    (lib.warn "the terraform has been removed on the darwin platform" pkgs.emptyDirectory)
  ];
}
