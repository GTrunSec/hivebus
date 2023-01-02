{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nil
    (rust-bin.nightly.latest.default.override {extensions = ["rust-src"];})
    rust-bin.nightly.latest."rust-analyzer-preview"
    tokio-console
  ];
}
