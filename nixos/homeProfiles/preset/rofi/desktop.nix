{profiles}: let
  src = profiles + "/rofi";
in {
  home.file.".config/rofi/off.sh".source = "${src}/off.sh";
  home.file.".config/rofi/colors.rasi".source = "${src}/colors.rasi";
  home.file.".config/rofi/launcher.sh".source = "${src}/launcher.sh";
  home.file.".config/rofi/launcher_theme.rasi".source = "${src}/launcher_theme.rasi";
  home.file.".config/rofi/powermenu.sh".source = "${src}/powermenu.sh";
  home.file.".config/rofi/powermenu_theme.rasi".source = "${src}/powermenu_theme.rasi";
}
