{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  exports = cell.pops.exports.nixos;
in {
  flops = {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [];
    };
    imports = l.flatten [
      # load the default/common nixosConfiguraitons
      (l.attrValues exports.profiles.default.bootstrap)
      # (l.attrValues exports.profiles.default.<category>)
      exports.modules.default
      exports.modules.flops

      # load the custom settings
      cell.profiles.flops
    ];
  };
}
