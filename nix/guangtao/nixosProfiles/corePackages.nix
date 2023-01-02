{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  environment.systemPackages = with nixpkgs; [
    clang
  ];
}
