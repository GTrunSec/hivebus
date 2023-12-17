let
  inherit (inputs) dmerge;
in
(omnibus.pops.homeProfiles.addLoadExtender {
  load = {
    inputs = {
      inputs = root.pops.subflake.inputs;
    };
  };
}).addExporters
  [
    (POP.extendPop flops.haumea.pops.exporter (
      selfP: _super: {
        exports.macbook = selfP.outputs [
          inputs.self.hosts.macbook.omnibus.homeProfiles.alacritty
        ];
      }
    ))
  ]
