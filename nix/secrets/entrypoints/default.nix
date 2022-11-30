{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab.writers.lib) writeShellApplication;

  l = inputs.nixpkgs.lib // builtins;
in {
  show-sshKey = writeShellApplication {
    name = "show-sshKey";
    runtimeInputs = with inputs.nixpkgs; [coreutils];
    text = l.fileContents ./show-sshKey.sh;
  };
}
