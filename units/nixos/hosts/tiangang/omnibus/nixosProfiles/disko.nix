{ flops }:
{
  value =
    {
      selfModule',
      inputs,
      lib,
    }:
    let
      l = lib // builtins;
    in
    selfModule' (
      m:
      flops.mergeToDepth 10 m {
        config.disko.devices.disk.sda.content.partitions.root.content.subvolumes =
          l.removeAttrs
            m.config.disko.devices.disk.sda.content.partitions.root.content.subvolumes
            [ "/swap" ];
      }
    );
  path = [
    "presets"
    "fileSystems"
    "disko-btrfs"
  ];
}
