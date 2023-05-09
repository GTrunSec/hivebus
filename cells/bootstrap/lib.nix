{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  guangtao = import "${(std.incl self ["flake.nix"])}/flake.nix";
in {
  nixConfig = {
    guangtao.nix.settings = guangtao.nixConfig;
  };
}
