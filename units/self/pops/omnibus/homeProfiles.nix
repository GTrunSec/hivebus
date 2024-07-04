{
  omnibus,
  inputs,
  projectRoot,
  POP,
  flops,
}:
(omnibus.src.pops.homeProfiles.addLoadExtender {
  load = {
    inputs = {
      inputs = { };
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
