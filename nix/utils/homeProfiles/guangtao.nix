{
  inputs,
  cell,
}: {
  imports =
    [
      cell.homeModules.chat
      cell.homeModules.notes
      cell.homeModules.dropbox
      # cell.homeModules.flameshot
    ]
    ++ cell.homeSuites.mathematical;
}
