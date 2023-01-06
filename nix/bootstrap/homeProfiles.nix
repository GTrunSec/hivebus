{
  inputs,
  cell,
}: {
  default = {
    imports = [
      cell.homeModules.git
    ];
  };

  guangtao = {
    imports = [
      cell.homeProfiles.default
    ];
    programs.git = {
      userEmail = "gtrunsec@hardenedlinux.org";
      userName = "guangtao";
    };
  };
}
