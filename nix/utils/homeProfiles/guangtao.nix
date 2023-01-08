{
  inputs,
  cell,
}: {
  imports =
    [
      cell.homeModules.chat
      cell.homeModules.notes
      cell.homeModules.misc
    ]
    ++ cell.homeSuites.mathematical;
}
