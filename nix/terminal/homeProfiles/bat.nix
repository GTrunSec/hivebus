{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.common.lib) __utils__;
in {
  catppuccin-mocha.programs.bat = {
    config = {
      theme = "Catppuccin-mocha";
      style = "changes,header";
    };
    # bat cache --build
    themes = {
      Catppuccin-mocha = builtins.readFile (__utils__.catppuccin-bat + "/Catppuccin-mocha.tmTheme");
    };

    extraPackages = with nixpkgs.bat-extras; [
      batman
    ];
  };
}
