{
  inputs,
  cell,
}: {
  imports =
    [
      cell.homeModules.chat
      cell.homeModules.notes
    ]
    ++ cell.homeSuites.mathematical;
}
