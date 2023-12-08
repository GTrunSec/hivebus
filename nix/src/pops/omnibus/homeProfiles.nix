let
  inherit (inputs) dmerge;
in
omnibus.pops.homeProfiles.addExporters [
  (POP.extendPop flops.haumea.pops.exporter (
    self: _super: {
      exports.macbook = self.outputs [
        {
          value =
            {selfModule'}:
            with dmerge;
            selfModule' (
              m:
              dmerge m {
                programs.alacritty = {
                  settings = {
                    window.opacity = 0.7;
                    font.size = 18.0;
                  };
                };
              }
            );
          path = [
            "presets"
            "alacritty"
          ];
        }
      ];
    }
  ))
]
