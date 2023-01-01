{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;

  inherit (cell) homeProfiles;
in
  {
    default = with homeProfiles;
      [
        shellPrograms
        shellPackages
        corePackages
        git
      ]
      ++ [
        inputs.cells.base.homeProfiles.default
        inputs.cells.utils.homeProfiles.default
      ]
      ++ inputs.cells.terminal.homeSuites.default;

    mathematic = with homeProfiles; [
      latexPackages
    ];

    graphics = with homeProfiles; [
      inputs.cells.window-managers.homeProfiles.hyprland
      wayland
    ];

    emacs = with homeProfiles;
      l.optionals nixpkgs.stdenv.isLinux [
        inputs.cells.emacs.homeProfiles.linux
      ]
      ++ l.optionals nixpkgs.stdenv.isDarwin [
        inputs.cells.emacs.homeProfiles.darwin
      ]
      ++ [
        cell.homeModules.emacs
      ];
  }
  // l.mapAttrs (_: v: import v {inherit inputs cell;})
  (inputs.cells.common.lib.rakeLeaves ./homeProfiles)
