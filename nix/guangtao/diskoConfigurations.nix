{
  desktop = {disks ? ["/dev/sda"], ...}: {
    disk = {
      sda = {
        type = "disk";
        device = builtins.elemAt disks 0;
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              type = "partition";
              name = "ESP";
              start = "1MiB";
              end = "128MiB";
              fs-type = "fat32";
              bootable = true;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            }
            {
              name = "root";
              type = "partition";
              start = "128MiB";
              end = "100%";
              content = {
                type = "btrfs";
                extraArgs = "-f";
                subvolumes = {
                  "/rootfs" = {
                    mountpoint = "/";
                  };
                  # Mountpoints inferred from subvolume name
                  "/home" = {
                    mountOptions = ["compress=zstd"];
                  };
                  "/nix" = {
                    mountOptions = ["compress=zstd" "noatime"];
                  };
                  "/persist" = {
                    mountOptions = ["compress=zstd" "noatime"];
                  };
                };
              };
            }
          ];
        };
      };
    };
    nodev = {
      "/tmp" = {
        fsType = "tmpfs";
        mountOptions = [
          "defaults"
          "size=4G"
          "mode=755"
        ];
      };
    };
  };
}
