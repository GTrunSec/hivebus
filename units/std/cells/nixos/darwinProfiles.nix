inputs.omnibus.darwinProfiles.addLoadExtender {
  load = {
    src = inputs.self + "/units/nixos/darwinProfiles";
    inputs = {
      inherit cell inputs;
    };
  };
}
