{
  value =
    {selfModule', inputs}:
    let
      inherit (inputs) dmerge;
    in
    selfModule' (
      m:
      dmerge m {
        config.programs.alacritty = {
          settings = {
            font = {
              size = 21.0;
              normal = {
                family = "JetBrainsMono Nerd Font";
                style = "Regular";
              };
            };
          };
        };
      }
    );
  path = [
    "presets"
    "alacritty"
  ];
}
