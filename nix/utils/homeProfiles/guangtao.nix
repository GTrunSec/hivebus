{
  inputs,
  cell,
}: {
  imports =
    [
      cell.homeModules.chat
      cell.homeModules.notes
      cell.homeModules.misc
      cell.homeModules.dropbox
    ]
    ++ cell.homeSuites.mathematical;
}
