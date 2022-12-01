{
  inputs,
  cell,
}: {
  default = {
     imports = [
      inputs.cells.version-management.homeProfiles.git
    ];
  };
}
