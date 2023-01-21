{
  inputs,
  cell,
}: {
  config,
  pkgs,
  ...
}: let
  inherit (inputs.cells-lab.writers.lib) writeShellApplication;
  nixgl = writeShellApplication {
    name = "nixgl";
    runtimeInputs = with inputs.nixpkgs; [];
    runtimeEnv = {
      NIXPKGS_ALLOW_UNFREE = 1;
    };
    # https://download.nvidia.com/XFree86/Linux-x86_64/
    text = ''
      if [ ! -f "$HOME/.nix-profile/bin/nixGLNvidia-${config.hardware.nvidia.package.version}" ]; then
         nix profile install github:guibou/nixGL#nixGLNvidia --impure \
         --override-input nixpkgs github:nixos/nixpkgs/${inputs.nixos.sourceInfo.rev}
       fi
       exec "$HOME"/.nix-profile/bin/nixGLNvidia-${config.hardware.nvidia.package.version} "$@"
    '';
  };
in {
  environment.systemPackages = [
    nixgl
  ];
}
