_:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  config =
    with lib;
    mkMerge [
      {
        environment.systemPackages = with pkgs; [
          (rust-bin.nightly.latest.default.override {extensions = ["rust-src"];})
          rust-bin.nightly.latest."rust-analyzer-preview"
          tokio-console
        ];
        hive.env.PATH = [
          "\${CARGO_BIN}"
          "\${CARGO_HOME}"
        ];
        environment.variables = {
          CARGO_HOME = "\${HOME}/.cargo";
          CARGO_BIN = "\${HOME}/.cargo/bin";
        };
      }
    ];
}
