{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  shellPrograms = import ./homeProfiles/shellPrograms.nix;
  shellPackages = import ./homeProfiles/shellPackages.nix {inherit inputs cell;};

  alacritty.programs.alacritty = {
    enable = true;
    CSIuSupport = true;
    settings = {
      env.TERM = "xterm-256color";
      window.decorations = "full";
      font.size = 9.0;
      cursor.style = "Beam";

      # snazzy theme
      colors = {
        # Default colors
        primary = {
          background = "0x282a36";
          foreground = "0xeff0eb";
        };

        # Normal colors
        normal = {
          black = "0x282a36";
          red = "0xff5c57";
          green = "0x5af78e";
          yellow = "0xf3f99d";
          blue = "0x57c7ff";
          magenta = "0xff6ac1";
          cyan = "0x9aedfe";
          white = "0xf1f1f0";
        };

        # Bright colors
        bright = {
          black = "0x686868";
          red = "0xff5c57";
          green = "0x5af78e";
          yellow = "0xf3f99d";
          blue = "0x57c7ff";
          magenta = "0xff6ac1";
          cyan = "0x9aedfe";
          white = "0xf1f1f0";
        };
      };
    };
  };
  git.programs.git = {
    enable = true;
    delta.enable = true;
    lfs.enable = true;

    delta.options = {
      plus-style = "syntax #012800";
      minus-style = "syntax #340001";
      syntax-theme = "Monokai Extended";
      navigate = true;
    };

    extraConfig = {
      core.autocrlf = "input";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.enabled = true;
    };
  };
}
