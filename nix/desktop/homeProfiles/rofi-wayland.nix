{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  src = "${(std.incl self ["profiles/rofi"])}/profiles/rofi";
  inherit (cell) homeProfiles;
in {
  default = {
    imports = [homeProfiles.rofi-wayland.packages];
  };

  packages.home.packages = with nixpkgs; [
    rofi-wayland
  ];

  guangtao = {
    imports = [
      homeProfiles.rofi-wayland.default
    ];
    home.file.".config/rofi/off.sh".source = "${src}/off.sh";
    home.file.".config/rofi/colors.rasi".source = "${src}/colors.rasi";
    home.file.".config/rofi/launcher.sh".source = "${src}/launcher.sh";
    home.file.".config/rofi/launcher_theme.rasi".source = "${src}/launcher_theme.rasi";
    home.file.".config/rofi/powermenu.sh".source = "${src}/powermenu.sh";
    home.file.".config/rofi/powermenu_theme.rasi".source = "${src}/powermenu_theme.rasi";
  };
}
