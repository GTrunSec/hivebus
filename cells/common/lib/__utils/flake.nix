{
  inputs = {
    catppuccin-hyprland = {
      url = "github:catppuccin/hyprland";
      flake = false;
    };
    catppuccin-waybar = {
      url = "github:catppuccin/waybar";
      flake = false;
    };
    catppuccin-gitui = {
      url = "github:catppuccin/gitui";
      flake = false;
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    catppuccin-wezterm = {
      url = "github:catppuccin/wezterm";
      flake = false;
    };

    slurp = {
      url = "github:emersion/slurp?ref=pull/95/head";
      flake = false;
    };

    nu-scripts = {
      url = "github:nushell/nu_scripts";
      flake = false;
    };

    sketchviz = {
      url = "github:gpotter2/sketchviz";
      flake = false;
    };
  };

  outputs = {self, ...}: {};
}
