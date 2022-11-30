# credit: https://github.com/LEXUGE/flake/blob/main/cfgs/x1c7/services.nix
{
  # Use btrbk to snapshot persistent states and home
  services.btrbk.instances.snapshot = {
    # snapshot on the start and the middle of every hour.
    onCalendar = "*:00,30";
    settings = {
      timestamp_format = "long-iso";
      preserve_day_of_week = "monday";
      preserve_hour_of_day = "23";
      # All snapshots are retained for at least 6 hours regardless of other policies.
      snapshot_preserve_min = "6h";
      volume."/" = {
        snapshot_dir = ".snapshots";
        subvolume."persist".snapshot_preserve = "48h 7d";
        subvolume."persist/home".snapshot_preserve = "48h 7d 4w";
      };
    };
  };
}
