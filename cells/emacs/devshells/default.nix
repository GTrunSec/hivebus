{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  jinx = nixpkgs.mkShell {
    buildInputs = with nixpkgs; [
      enchant2
      emacs
    ];
    shellHook = ''
       cc -O2 -Wall -Wextra -fPIC -shared -Wl,--no-as-needed \
      -I${nixpkgs.enchant2.dev}/include/enchant-2 -lenchant-2 -o jinx-mod.so jinx-mod.c
    '';
  };
}
