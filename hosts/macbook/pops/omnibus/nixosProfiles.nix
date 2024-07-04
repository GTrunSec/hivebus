{ inputs }:
inputs.self.pops.omnibus.nixosProfiles.addLoadExtender {
  load.inputs = {
    system = "aarch64-darwin";
  };
}
