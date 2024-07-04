{
  omnibus,
  inputs,
  projectRoot,
}:
(omnibus.pops.scripts.addLoadExtender {
  load = {
    src = projectRoot + /units/scripts;
    inputs = {
      inputs = inputs // {
        makesSrc = omnibus.flake.inputs.makesSrc;
        climodSrc = omnibus.flake.inputs.climodSrc;
      };
    };
  };
})
