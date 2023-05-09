{pkgs, ...}: {
  # auto unlock
  systemd.user.services.gnome-keyring = {
    Unit = {
      Description = "customd GNOME Keyring";
      PartOf = ["graphical-session-pre.target"];
    };

    Service = {
      ExecStart = ''
        ${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/cat /run/secrets/gnome-keyring | ${pkgs.gnome.gnome-keyring}/bin/gnome-keyring-daemon --foreground --unlock'
      '';
      Restart = "on-abort";
    };

    Install = {WantedBy = ["graphical-session-pre.target"];};
  };
}
