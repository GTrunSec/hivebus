{
  inputs,
  cell,
}: rec {
  default = [
    cell.homeModules.gpg
  ];

  full =
    default
    ++ [
      cell.homeModules.keychain
    ];
}
