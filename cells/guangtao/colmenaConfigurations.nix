{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = {
    deployment = {
      allowLocalDeployment = true;
      targetHost = "127.0.0.1";
    };
    inherit (cell.nixosConfigurations.desktop) bee imports;
  };
}
