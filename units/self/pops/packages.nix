{
  omnibus,
  inputs,
  projectRoot,
}:
omnibus.pops.packages {
  src = projectRoot + /units/packages;
  inputs = {
    inputs = inputs;
  };
}
