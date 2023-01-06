{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  guangtao = {
    home.packages = with nixpkgs; [
      brave
      firefox
    ];
  };
}
