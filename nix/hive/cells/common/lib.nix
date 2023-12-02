{inputs, cell}:
let
in
# inherit (inputs) nixpkgs haumea flops;
# inherit (inputs.flops.lib.flake) pops;
# inherit (inputs.flops.inputs) POP;
# l = nixpkgs.lib // builtins;
# callInputs =
#   (flops.lib.flake.pops.default.setInitInputs ./lib/__lock).setSystem
#     nixpkgs.system;
# callUtils =
#   (flops.lib.flake.pops.default.setInitInputs ./lib/__utils).setSystem
#     nixpkgs.system;
# callMainInputs =
#   (flops.lib.flake.pops.default.setInitInputs inputs.self).setSystem
#     nixpkgs.system;
# haumea.lib.load {
#   src = ./lib;
#   inputs = removeAttrs inputs [ "self" ];
# }
# //
{
  # inherit callInputs callUtils callMainInputs;

  # __inputs__ = callInputs.outputs;

  # std = with cell.lib;
  #   l.recursiveUpdate inputs.std {
  #     inputs = {
  #       microvm = __inputs__.microvm;
  #       arion = __inputs__.arion;
  #     };
  #   };
  # __utils__ = callUtils.outputs;
}
