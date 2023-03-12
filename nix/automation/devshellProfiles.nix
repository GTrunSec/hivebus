{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.std-ext.common.lib) __inputs__;

  terraform-providers-bin = __inputs__.terraform-providers.legacyPackages.providers;

  terraform = nixpkgs.terraform.withPlugins (p: [
    terraform-providers-bin.hashicorp.nomad
    terraform-providers-bin.dmacvicar.libvirt
    terraform-providers-bin.hashicorp.aws
    terraform-providers-bin.hashicorp.template
    terraform-providers-bin.cloudflare.cloudflare
  ]);
in {
  terraform = {
    commands = [
      {package = terraform;}
    ];
  };
}
