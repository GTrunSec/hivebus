{
  inputs,
  cell,
}: let
  inherit (inputs) haumea flops;
in
  flops.lib.configs.haumea.setInit {
    src = ./homeProfiles;
    inputs = {
      inherit cell;
      inputs = removeAttrs inputs ["self"];
      pkgs' = inputs.nixpkgs;
      lib = inputs.nixpkgs.lib;
    };
    transformer = with haumea.lib.transformers; [
      liftDefault
    ];
  }
