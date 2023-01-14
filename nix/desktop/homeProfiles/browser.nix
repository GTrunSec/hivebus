{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  guangtao = {
    imports = [cell.homeModules.brave];
    home.packages = with nixpkgs; [
      firefox-wayland
    ];
  };
}
