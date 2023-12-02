{lib}:
{
  _options = with lib; {
    monitor = mkOption {
      type = types.either types.str (types.listOf types.str);
      description = "The monitor to use";
    };
  };
}
