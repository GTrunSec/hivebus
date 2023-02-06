{
  inputs,
  cell,
}: {
  default = {
    imports = [
      cell.homeModules.kanshi
    ];
  };

  guangtao = {
    imports = [
      cell.homeProfiles.kanshi.default
    ];
    services.kanshi.profiles = {
      docked = {
        outputs = [
          {
            criteria = "DP-2";
            position = "3840,0";
            scale = 2.1;
            mode = "3840x2160";
          }
        ];
      };
    };
  };
}
