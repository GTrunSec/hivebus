{ config, lib, ... }:
let
  cfg = config.programs.git;
in
{
  config.programs.git =
    with lib;
    mkIf cfg.enable (mkMerge [
      (mkIf cfg.hive.default {
        ignores = [
          ".cache"
          ".direnv"
          ".direnv.d"
          # object files
          "*.a"
          "*.o"
          "*.so"
          # nix stuff
          "result"
          "result-*"
        ];
      })
      (mkIf cfg.hive.haskell {
        ignores = [
          # from: https://github.com/chessai/my-chainweb-node/blob/main/home/gitdefault.nix
          ".ghc.environment.*"
          "dist"
          "dist-*"
          "cabal-dev"
          "*.dyn_o"
          "*.dyn_hi"
          "*.prof"
          "*.hp"
          "*.eventlog"
          ".cabal-sandbox/"
          "cabal.sandbox.config"
          "cabal.config"
          "cabal.project.local"
          ".stack-work/"
          "stack.yaml.lock"
        ];
      })
      (mkIf cfg.hive.gpg {
        # from: https://github.com/NickCao/flakes/blob/78697752fabd779358392700ad2944282186eb38/nixos/local/home.nix#L307
        extraConfig = {
          commit.gpgSign = true;
          gpg = {
            format = "ssh";
            ssh.defaultKeyCommand = "ssh-add -L";
            ssh.allowedSignersFile = toString (pkgs.writeText "allowed_signers" "");
          };
        };
      })
      (mkIf cfg.delta.enable {
        delta.options = {
          plus-style = "syntax #012800";
          minus-style = "syntax #340001";
          syntax-theme = "Monokai Extended";
          navigate = true;
        };
      })
    ]);
}
