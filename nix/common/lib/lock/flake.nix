{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/cfb43ad7b941d9c3606fb35d91228da7ebddbfc5";
  };

  inputs = {
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";

    emacs-darwin.url = "github:cmacrae/emacs";
  };

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland";
    hyprwm-contrib.url = "github:hyprwm/contrib";

    eww = {
      url = "github:elkowar/eww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.inputs.nixpkgs.follows = "nixpkgs";

    nixgl.url = "github:guibou/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
  };

  inputs = {
    # https://github.com/DeterminateSystems/bootspec
    # bootsec.url = "github:DeterminateSystems/bootspec";
    # bootsec.inputs.nixpkgs.follows = "nixpkgs";
    #   lanzaboote = {
    #   url = "github:nix-community/lanzaboote";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-utils.follows = "flake-utils";
    # };

    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    flake-utils.follows = "ragenix/flake-utils";

    sops-nix.url = "github:Mic92/sops-nix?ref=pull/299/head"; # sops-template
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    ragenix.url = "github:yaxitech/ragenix";

    ragenix.inputs.nixpkgs.follows = "nixpkgs";
    ragenix.inputs.agenix.follows = "agenix";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    agenix-rekey.url = "github:oddlama/agenix-rekey";
    agenix-rekey.inputs.nixpkgs.follows = "nixpkgs";

    vault-secrets.url = "github:gtrunsec/vault-secrets";
    vault-secrets.inputs.nixpkgs.follows = "nixpkgs";

    resign.url = "github:NickCao/resign";
    resign.inputs.nixpkgs.follows = "nixpkgs";
    resign.inputs.flake-utils.follows = "flake-utils";

    impermanence.url = "github:nix-community/impermanence";
  };

  inputs = {
    typst.url = "github:typst/typst";
    typst.inputs.nixpkgs.follows = "nixpkgs";

    nickel.url = "github:tweag/nickel";
    nickel.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    nil.url = "github:oxalica/nil";

    devos-ext-lib.url = "github:divnix/devos-ext-lib/?ref=refs/pull/8/head";
    devos-ext-lib.inputs.nixpkgs.follows = "nixpkgs";
  };
  # Orchestration
  inputs = {
    nomad-driver.url = "github:input-output-hk/nomad-driver-nix";
    nomad-driver.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    julia2nix.url = "github:JuliaCN/Julia2Nix.jl";
    julia2nix.inputs.nixpkgs.follows = "nixpkgs";

    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";

    attic.url = "github:zhaofengli/attic";
    attic.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-hardenedlinux.url = "github:hardenedlinux/nixpkgs-hardenedlinux";
    nixpkgs-hardenedlinux.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, ...}: {};
}
