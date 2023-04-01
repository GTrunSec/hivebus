{
  config,
  lib,
  pkgs,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        home.packages = with pkgs; [
          peco
          ghq
        ];

        programs.zsh = {
          enable = true;
          autocd = true;
          dotDir = ".config/zsh";
          enableAutosuggestions = true;
          enableCompletion = true;
          enableSyntaxHighlighting = true;
          history = {
            path = "$HOME/" + config.programs.zsh.dotDir + "/.zsh_history";
            share = true;
            save = 10000000;
            ignoreDups = true;
            extended = true;
            size = 10000000;
          };
          # kitty +kitten ssh myserver
          shellAliases = with pkgs; {
            l = "exa -lah";
            f = "rg --files";
            E = "env SUDO_EDITOR=\"emacsclient\" sudo -e";
            e = "emacsclient";
            em = "emacs";
            cp = "cp -i";
            mv = "mv -i";
            cdghq = "cd $(ghq root)/$(ghq list | peco)";
            ##update Nixpkgs
            fp = "git fetch && git pull";
            sshi = "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
            ag0 = "rg --max-depth=1";
            # so = "pactl set-default-sink (pacmd list-sinks | awk \\\'/name:.*usb/{if (a != \"\") print a;} {a=$NF}\\\')";
            # si = "pactl set-default-sink (pacmd list-sinks | awk \\\'/name:.*pci/{if (a != \"\") print a;} {a=$NF}\\\')";
          };

          initExtraBeforeCompInit =
            lib.optionalString pkgs.stdenv.isDarwin ''
              export PATH=/run/current-system/sw/bin:/run/current-system/etc/profiles/per-user/$USER/bin:/opt/homebrew/bin:/bin/:/usr/bin:$PATH
            ''
            + builtins.readFile ./compinit-setopt.zsh;

          initExtra =
            builtins.readFile ./zshrc.zsh
            + builtins.readFile ./init-bindkey.zsh
            + builtins.readFile ./autoload.zsh;

          plugins = [
            {
              name = "zsh-history-substring-search";
              src = pkgs.zsh-history-substring-search;
            }
          ];
        };
      }
      (
        mkIf pkgs.stdenv.isDarwin {
          programs.zsh.sessionVariables = {
            TMUX_TMPDIR = "$HOME/.config/.";
            LANG = "en_US.UTF-8";
            export = "LC_ALL=en_US.UTF-8";
            GNUPGHOME = "$HOME/.gnupg";
            NIX_PATH = "nixpkgs=${pkgs.path}";
            # FIXME: emacs can not get the path correctly
            SHELL = "/bin/bash";
          };
        }
      )
      (
        mkIf pkgs.stdenv.isLinux {
          programs.zsh.shellAliases = {
          };
        }
      )
    ];
}
