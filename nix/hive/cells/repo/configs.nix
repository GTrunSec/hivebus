{ inputs, cell }:
with inputs.std.inputs.dmerge;
let
  cfg = {
    inherit (cell.pops.configs.exports.default) treefmt lefthook conform;
  };
  inherit (cell.pops.configs.exports.stdNixago) treefmt lefthook conform;
in
{
  lefthook = {
    inherit (lefthook) default;
  };
  treefmt = {
    default = (treefmt.default cfg.treefmt.topiary cfg.treefmt.nvfetcher);
  };
  conform = rec {
    default = conform.default custom;
  };

  just = {
    data = {
      tasks = import ./configs/justfile.nix { inherit inputs cell; };
    };
  };
}
