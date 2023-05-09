{
  inputs,
  cell,
}: let
  id = "vm-qemu-1";
in {
  microvm.forwardPorts = [
    {
      from = "host";
      host.port = 6000;
      guest.port = 22;
    }
    {
      from = "host";
      host.port = 3000;
      guest.port = 3000;
    }
  ];
  microvm = {
    hypervisor = "qemu";

    mem = 4000;
    vcpu = 4;

    interfaces = [
      {
        type = "user";
        inherit id;
        mac = "00:02:00:01:01:00";
      }
    ];

    volumes = [
      {
        mountPoint = "/var";
        image = "/tmp/user-${id}.img";
        size = 2048;
      }
    ];
  };
}
