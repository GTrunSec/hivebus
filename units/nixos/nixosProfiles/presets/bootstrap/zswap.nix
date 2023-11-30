{
  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.compressor=lz4"
    "zswap.max_pool_percent=25"
  ];
  boot.initrd.availableKernelModules = [
    "lz4"
    "lz4_compress"
    "z3fold"
  ];
  boot.postBootCommands = ''
    echo z3fold > /sys/module/zswap/parameters/zpool
    echo lz4 > /sys/module/zswap/parameters/compressor
  '';
}
