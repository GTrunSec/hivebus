{
  inputs = {
    omnibus.url = "github:gtrunsec/omnibus";
  };

  outputs =
    { self, ... }@inputs:
    let
      inherit (inputs.omnibus.inputs.flops.inputs.nixlib) lib;
      eachSystem = lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      srcPop = (import ./nix/src { inherit inputs eachSystem; });
      src = srcPop.exports.default;
    in
    src.flakeOutputs
    // {
      inherit src;
      pops = src.pops // {
        self = srcPop;
      };

      colmena = {
        meta = {
          nixpkgs = import inputs.omnibus.flake.inputs.nixpkgs { system = "x86_64-linux"; };
          nodeNixpkgs.host-a = self.hosts.desktop.layouts.hive.bee.pkgs;
          nodeNixpkgs.host-b = self.hosts.tiangang.layouts.hive.bee.pkgs;
          nodeNixpkgs.host-c = self.hosts.macbook.layouts.hive.bee.pkgs;
        };
        # Also see the non-Flakes hive.nix example above.
        host-a = {
          inherit (self.hosts.desktop.layouts.hive) imports;
        };
        host-b = {
          inherit (self.hosts.tiangang.layouts.hive) imports;
        };
        host-c = {
          inherit (self.hosts.macbook.layouts.hive) imports;
        };
      };
    };
}
