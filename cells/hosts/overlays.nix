inputs.flops.lib.configs.haumea.setInit {
  src = ./overlays;
  inputs = {
    inherit cell;
    inputs = removeAttrs inputs ["self"];
    exports = inputs.cells.nixos.pops.exports;
    inherit (inputs.cells.common.lib) __inputs__ __utils__;
  };
}
