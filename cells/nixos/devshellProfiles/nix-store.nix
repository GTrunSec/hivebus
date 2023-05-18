{config, ...}: {
  commands = [
    {
      name = "repair";
      command = ''
        ## sudo rm -rf /nix/store/.links/
        nix-store --verify --check-contents --repair
      '';
    }
  ];
}
