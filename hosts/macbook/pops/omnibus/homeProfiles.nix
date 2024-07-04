{ inputs }:
inputs.self.pops.omnibus.homeProfiles.addLoadExtender {
  load.inputs = {
    system = "aarch64-darwin";
  };
}
