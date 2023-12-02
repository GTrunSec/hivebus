{
  inputs,
  root,
  super,
}:
let
  inputs' = inputs // super.pops.subflake.inputs;
in
(inputs.omnibus.load {
  src = inputs.self.outPath + "/units/nixos/hosts";
  inputs = {
    inputs = inputs';
    omnibus = inputs.omnibus // {
      self = root.omnibus.exports.default;
      nixosProfiles =
        (inputs.omnibus.pops.nixosProfiles.addLoadExtender {
          load.inputs.inputs = inputs';
        }).exports.default;
    };
  };
})
