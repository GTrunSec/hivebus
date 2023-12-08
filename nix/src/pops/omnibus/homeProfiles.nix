let
  inherit (inputs) dmerge;
in
omnibus.pops.homeProfiles.addExporters [
  (POP.extendPop flops.haumea.pops.exporter (
    selfP: _super: {
      exports.macbook = selfP.outputs [
        inputs.self.hosts.macbook.omnibus.homeProfiles.alacritty
      ];
    }
  ))
]
