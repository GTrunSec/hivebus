{
  inputs,
  cell,
}: let
  inherit (inputs.std-ext.writers.lib) writeShellApplication;

  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;
in {
  swww-random = writeShellApplication {
    name = "swww-random";
    runtimeInputs = with inputs.nixpkgs; [cell.packages.swww];
    text = l.fileContents ./swww_randomize.sh;
  };
  hyprland-window = writeShellApplication {
    name = "hyprland-window";
    runtimeInputs = with inputs.nixpkgs; [nixpkgs.jq];
    text = l.fileContents ./hyprland_window.sh;
  };
}
