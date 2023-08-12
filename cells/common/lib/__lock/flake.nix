{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/5767e7b931f2e6ee7f582d564b8665095c059f3b";

    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
  };

  inputs = {
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";

    emacs-darwin.url = "github:cmacrae/emacs";

    nur.url = "github:nix-community/NUR";
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
    nixpkgs-dropbox.url = "github:nixos/nixpkgs/?ref=pull/242730/head";
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

    nix.url = "github:NixOS/nix/2.15-maintenance";
    nix.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix?ref=pull/299/head"; # sops-template
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    ragenix.url = "github:yaxitech/ragenix";

    ragenix.inputs.nixpkgs.follows = "nixpkgs";
    ragenix.inputs.agenix.follows = "agenix";

    agenix.url = "github:ryantm/agenix";
    # agenix.inputs.nixpkgs.follows = "nixpkgs";

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
    # nickel.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    nil.url = "github:oxalica/nil";

    devos-ext-lib.url = "github:divnix/devos-ext-lib/?ref=refs/pull/8/head";
    devos-ext-lib.inputs.nixpkgs.follows = "nixpkgs";

    namaka.url = "github:nix-community/namaka";
    namaka.inputs.nixpkgs.follows = "nixpkgs";

    nix-init.url = "github:nix-community/nix-init";
    # nix-init.inputs.nixpkgs.follows = "nixpkgs";
  };
  # Orchestration
  inputs = {
    nomad-driver.url = "github:input-output-hk/nomad-driver-nix";
    nomad-driver.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    microvm.url = "github:astro/microvm.nix";

    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";

    julia2nix.url = "github:JuliaCN/Julia2Nix.jl";
    julia2nix.inputs.nixpkgs.follows = "nixpkgs";

    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";

    attic.url = "github:zhaofengli/attic";

    nixpkgs-hardenedlinux.url = "github:hardenedlinux/nixpkgs-hardenedlinux";
    nixpkgs-hardenedlinux.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, ... }: { };
}
