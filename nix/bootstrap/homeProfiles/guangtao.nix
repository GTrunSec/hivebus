{
  inputs,
  cell,
}: {pkgs, ...}: {
  imports = [
    cell.homeProfiles.default
  ];
  programs.git = {
    userEmail = "gtrunsec@hardenedlinux.org";
    userName = "guangtao";
    ignores = [
      ".projectile"
      ".indium.json"
      ".ccls-cache"
      ".Rhistory"
      ".notdeft*"
      "eaf"
      ".auctex-auto"
      "vast.db"
      ".DS_Store"
      "result"
      ".ipynb_checkpoints"
      "__pycache__"
      "*.org.organice-bak"
      ".direnv"
      ".direnv.d"
      ".secrets"
      ".cargo"
    ];
  };
  xsession.profileExtra = ''
    export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket;
  '';

  systemd.user.services."ssh-agent" = {
    Unit = {
      Description = "SSH key agent";
    };

    Service = {
      Type = "simple";
      # DISPLAY required for ssh-askpass to work
      Environment = [
        "SSH_AUTH_SOCK=%t/ssh-agent.socket"
        "DISPLAY=:0"
      ];
      ExecStart = "${pkgs.openssh}/bin/ssh-agent -D -a $SSH_AUTH_SOCK";
    };

    Install = {
      WantedBy = ["default.target"];
    };
  };
}
