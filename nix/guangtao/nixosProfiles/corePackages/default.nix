{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  environment.systemPackages = with nixpkgs; [
    clang
    (
      pkgs.writeShellScriptBin "nrepl" ''
        export PATH=${pkgs.coreutils}/bin:${pkgs.nixUnstable}/bin:$PATH
        if [ -z "$1" ]; then
           nix repl --argstr host "$HOST" --argstr flakePath "$PRJ_ROOT" ${./nrepl.nix}
         else
           nix repl --argstr host "$HOST" --argstr flakePath $(readlink -f $1 | sed 's|/flake.nix||') ${./nrepl.nix}
         fi
      ''
    )
    cachix
    wget
    curl
  ];
}
