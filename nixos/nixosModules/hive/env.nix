{lib}: {
  _options = with lib; {
    PATH = lib.mkOption {
      default = [];
      type = types.list types.unspecified;
      description = ''
        A list of directories that will be added to the PATH environment
      '';
    };
  };
}
