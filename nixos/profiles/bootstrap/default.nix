# {
#   lib,
#   config,
#   pkgs,
# }:
# with lib; (mkMerge [
#   {
#     services.openssh.enable = true;
#   }
#   (mkIf pkgs.stdenv.isLinux {
#     system.stateVersion = config.system.nixos.version;
#   })
# ])
{
  lib,
  config,
  pkgs,
}: {
  config = with lib; (mkMerge [
    {
      services.openssh.enable = true;
    }
    (mkIf pkgs.stdenv.isLinux {
      system.stateVersion = config.system.nixos.version;
    })
  ]);
}
