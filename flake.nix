# SPDX-FileCopyrightText: 2023 The omnibus Authors
# SPDX-FileCopyrightText: 2024 The omnibus Authors
#
# SPDX-License-Identifier: MIT

{
  inputs = {
    omnibus.url = "github:gtrunsec/omnibus";
    # omnibus.url = "git+file:/Users/guangtao/Dropbox/omnibus";
  };

  outputs =
    inputs:
    let
      inherit (inputs.omnibus.inputs.flops.inputs.nixlib) lib;
      eachSystem = lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      pops.hivebus = import ./units/self { inherit inputs eachSystem; };
      hivebus = pops.hivebus.exports.default;
    in
    lib.recursiveUpdate { inherit pops; } hivebus.flakeOutputs;
}
