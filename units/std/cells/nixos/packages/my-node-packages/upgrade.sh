# /bin/sh
# run inside nix-shell -p nodePackages.node2nix

cmd="node2nix -10 -i packages.json -c plugins.nix"

if ! type "node2nix" &>/dev/null; then
  nix-shell -p nodePackages.node2nix --run "$cmd"
else
  $cmd
fi
