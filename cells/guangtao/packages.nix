{
  inputs,
  cell,
}: let
  inherit (cell.lib) nixpkgs;
in {
  inherit
    (nixpkgs)
    promnesia
    orgparse
    material-symbols
    # chatgpt-wrapper
    
    mind-wave
    ;
}
