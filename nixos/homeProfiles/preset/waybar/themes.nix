{
  lib,
  profiles,
}: let
  l = lib // builtins;
  src = profiles + "/waybar";
in {
  default = {
    top = l.fromJSON (l.readFile "${src}/config-top.json");
    bottom = l.fromJSON (l.readFile "${src}/config-bottom.json");
  };
}
