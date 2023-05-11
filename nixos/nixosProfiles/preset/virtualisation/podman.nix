_: {}
# {
#   pkgs,
#   config,
#   lib,
#   ...
# }: {
#   virtualisation.podman = {
#     enable = true;
#     dockerCompat = true;
#     autoPrune.enable = true;
#     dockerSocket.enable = true;
#     defaultNetwork.settings.dns_enabled = true;
#   };

#   environment.systemPackages = with pkgs; [
#     docker-client
#     podman-compose
#     podman-tui
#   ];
# }
