{inputs, cell}:
let
  inherit (cell.lib) __inputs__;
in
{
  nomad = prev: final: {
    nomad-driver-nix =
      (prev.extend __inputs__.nomad-driver.overlay).nomad-driver-nix;
  };
}
