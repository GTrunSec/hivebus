{ inputs, root }:
inputs.self.pops.homeProfiles.addLoadExtender {
  load.inputs = {
    inputs.nixpkgs = root.macbook.bee.pkgs;
  };
}
