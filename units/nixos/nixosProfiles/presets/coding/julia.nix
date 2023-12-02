_:
{pkgs, ...}:
let
  julia-wrapped = pkgs.lib.julia-wrapped {
    package = pkgs.julia_19-bin;
    meta.mainProgram = "julia";
    enable = {
      GR = true;
      # python = inputs.cells.automation.packages.poetryPython;
    };
  };
in
{
  environment.systemPackages = with pkgs; [julia-wrapped];
}
