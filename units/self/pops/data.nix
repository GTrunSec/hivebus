{
  omnibus,
  inputs,
  projectRoot,
}:
omnibus.pops.data.addLoadExtender {
  load = {
    src = projectRoot + /units/data;
    inputs = {
      inputs = inputs;
    };
  };
}
