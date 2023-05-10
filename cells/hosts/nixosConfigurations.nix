{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (cell.pops) exports;
in {
  flops = let
    system = "x86_64-linux";
  in {
    bee.system = system;
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit system;
      config.allowUnfree = true;
      overlays = [];
    };
    imports = l.flatten [
      # load the default/common nixosConfiguraitons
      (l.attrValues exports.nixosProfiles.default.bootstrap)
      # (l.attrValues exports.profiles.default.<category>)
      exports.nixosModules.default

      # load the custom settings
      exports.nixosModules.flops
    ];
  };
}
