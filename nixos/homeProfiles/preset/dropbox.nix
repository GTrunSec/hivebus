_: {
  # FIXME: dropox missing module named 'gi'  https://github.com/NixOS/nixpkgs/issues/235345
  services.dropbox = {
    enable = true;
  };
}
