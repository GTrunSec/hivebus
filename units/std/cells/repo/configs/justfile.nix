{ inputs, cell }:
let
  l = inputs.nixpkgs.lib // builtins;

  nvfetcher-sources = l.foldr (a: b: a // b) { } (
    map
      (
        x:
        let
          x' = if x == "default" then "." else x;
        in
        {
          "nvfetcher-${x}" = {
            content = ''
              nix develop github:GTrunSec/std-ext#update --refresh --command nvfetcher-update cells/nixos/packages/${x'}/sources.toml
            '';
            description = "update ${x} toolchain with nvfetcher";
          };
        }
      )
      [
        "default"
        "emacs"
      ]
  );
in
{
  fmt = {
    description = "Formats all changed source files";
    content = ''
      treefmt $(git diff --name-only --cached)
    '';
  };
  nvfetcher = {
    description = "update sources with nvfetcher";
    args = [ "path" ];
    content = ''
      nix develop github:GTrunSec/std-ext#update --refresh --command nvfetcher-update {{path}}/sources.toml
    '';
  };
  rsync = {
    description = "rsync to remote";
    content = ''
      rsync -avzh --exclude='/hivebus/flake.lock' --exclude='/hivebus/flake.nix' 192.168.1.92:/home/guangtao/ghq/github.com/GTrunSec/hivebus ~/ghq/github.com/GTrunSec; nix flake lock --update-input omnibus
    '';
  };
  colmena = {
    args = [
      "action"
      "host"
    ];
    description = "Colmena build Guangtao Home Machine";
    content = ''
      colmena -f $PRJ_ROOT/nix/hive/flake.nix {{action}} --on hosts-{{host}}
    '';
  };
  age = {
    args = [
      "cell"
      "file"
    ];
    description = "edit the key age with ragenix";
    content = ''
      ragenix --edit ./cells/{{cell}}/secretProfiles/{{file}} --rules ./cells/{{cell}}/secretProfiles/secrets.nix
    '';
  };
  age-rekey = {
    description = "re-age key with ragenix";
    content = ''
      ragenix --rules $PRJ_ROOT/secrets/secrets.nix --rekey
    '';
  };
  darwin-build = {
    args = [ "machine" ];
    description = "build darwin machine";
    content = ''
      darwin-rebuild build --flake .#hosts-{{machine}}
    '';
  };
  nvfetcher-update = {
    args = [ "cell" ];
    description = "update packages via nvfetcher";
    content = ''
      nix develop github:GTrunSec/std-ext#devShells.x86_64-linux.update --refresh --command nvfetcher-update ./cells/{{cell}}/packages/sources.toml
    '';
  };
  nixos-build = {
    args = [ "host" ];
    description = "nixos-rebuild";
    content = ''
      nix build $PRJ_ROOT#nixosConfigurations.{{host}}.config.system.build.toplevel --no-link
    '';
  };
  node2nix-update = {
    description = "update packages via nvfetcher";
    content = ''
      cd $PRJ_ROOT/cells/nixos/packages/my-node-packages && sh ./upgrade.sh
    '';
  };
}
// nvfetcher-sources
