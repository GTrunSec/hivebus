{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zstd
    cmake
    atuin
  ];
}
