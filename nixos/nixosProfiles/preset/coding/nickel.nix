_: {pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nickel
    lsp-nls
  ];
}
