{
  omnibus,
  inputs,
  projectRoot,
  root,
  super,
}:
omnibus.pops.load {
  src = projectRoot + /hosts;
  inputs = {
    inherit (inputs) nixos-unstable;
    inputs = inputs // { hivebus = root; } // super.subflake.inputs;
  };
}
