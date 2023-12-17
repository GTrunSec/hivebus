{ inputs, cell }:
let
  inherit (inputs.hivebus.src) hosts;
in
{
  # exports your host configuration
  macbook = hosts.macbook.layouts.hive;
}
