{
  omnibus,
  flops,
  POP,
  projectDir,
}:
(omnibus.pops.flake.addInputsExtender (
  POP.extendPop flops.flake.pops.inputsExtender (
    self: super:
    let
      subflake = omnibus.pops.flake.setInitInputs ../../lock;
    in
    {
      inputs = subflake.inputs // {
        local.age.file = file: projectDir + /local/secrets/${file};
      };
    }
  )
))
