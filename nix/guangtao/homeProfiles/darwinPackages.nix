{
  inputs,
  cell,
}: {pkgs, ...}: {
  home.packages = with pkgs; [];
}
