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
  environment.sessionVariables = {
    CARGO_HOME = "\${HOME}/.cargo";
    CARGO_BIN = "\${HOME}/.cargo/bin";

    PATH = [
      "\${CARGO_BIN}"
      "\${CARGO_HOME}"
    ];
  };
}
