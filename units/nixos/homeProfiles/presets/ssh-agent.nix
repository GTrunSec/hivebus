_:
{
  config,
  lib,
  pkgs,
  ...
}:
{
  config =
    with lib;
    mkMerge [
      (mkIf pkgs.stdenv.isLinux {
        home.sessionVariables = {
          SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";
        };
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
            Restart = "always";
            ExecStart = "${pkgs.openssh}/bin/ssh-agent -D -a $SSH_AUTH_SOCK";
          };

          Install = {
            WantedBy = [ "default.target" ];
          };
        };
      })
    ];
}
