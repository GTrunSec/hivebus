{ inputs
, cell
,
}:
let
  inherit (inputs.std-ext.writers.lib) writeShellApplication;
  inherit (inputs) nixpkgs;

  l = inputs.nixpkgs.lib // builtins;
in
{
  jinx-compile = writeShellApplication {
    name = "show-sshKey";
    runtimeInputs = with nixpkgs; [ emacs ];
    text = ''
      cc -O2 -Wall -Wextra -fPIC -shared -Wl,--no-as-needed \
      -I${nixpkgs.enchant2.dev}/include/enchant-2 -lenchant-2 -o jinx-mod.so jinx-mod.c
    '';
  };
}
