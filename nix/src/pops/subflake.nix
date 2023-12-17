{
  omnibus,
  flops,
  POP,
  projectRoot,
}:
(omnibus.pops.flake.addInputsExtender (
  POP.extendPop flops.flake.pops.inputsExtender (
    self: super:
    let
      subflake = omnibus.pops.flake.setInitInputs (projectRoot + /nix/lock);
    in
    {
      inputs = subflake.inputs // {
        local.age.file = file: projectRoot + /local/secrets/${file};
      };
    }
  )
))
