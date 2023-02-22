{
  inputs,
  cell,
}: {pkgs, ...}: {
  services.yabai.enable = true;
  services.skhd.enable = true;
  services.skhd.skhdConfig = ''
    # fast focus desktop
    cmd + alt - x : yabai -m space --focus recent
    cmd + alt - 1 : yabai -m window --toggle border
    alt + shift - r   :   chunkc quit
    # focus window
    shift + alt - up     : yabai -m window --grid 1:1:0:0:1:1
  '';
}
