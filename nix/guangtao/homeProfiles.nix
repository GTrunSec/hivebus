{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;

  inherit (cell) homeProfiles homeModules;
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

    graphics = with homeProfiles;
      [
        inputs.cells.window-managers.homeProfiles.hyprland
        wayland
        kanshi
        eww
        rofi
      ]
      ++ [
        homeModules.qt
        homeModules.gtk
        homeModules.cursor
      ];

    terminal = with homeProfiles; [
      inputs.cells.terminal.homeProfiles.alacritty
      homeModules.programs.alacritty
    ];

    emacs = with homeProfiles;
      l.optionals nixpkgs.stdenv.isLinux [
        inputs.cells.emacs.homeProfiles.linux
      ]
      ++ l.optionals nixpkgs.stdenv.isDarwin [
        inputs.cells.emacs.homeProfiles.darwin
      ]
      ++ [
        cell.homeModules.programs.emacs
      ];

    applications = with homeProfiles; [
      browser
    ];
  }
  // inputs.cells.common.lib.importRakeLeaves ./homeProfiles
