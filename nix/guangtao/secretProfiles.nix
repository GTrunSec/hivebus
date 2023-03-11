{
  guangtao = rec {
    openssh-pub.desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLxc7EBr1Qi4M65O1KjXZf4bOBZMQ6YeDSFYzKzFan7 Desktop-guangtao-03-02-2023";
    openssh-pub.macbook = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK1QW0lG58r6yaI9xMQ+D5XA7RUQF8lfBanNs36Wrlw guangtaos-MBP.attlocal.net-guangtao-21-02-2023";
    openssh.authorizedKeys.keys = [
      openssh-pub.desktop
      openssh-pub.macbook
    ];
  };
  libvirtd = rec {
    openssh-pub.home3 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIg3koyHGJ14H1Cmy2gyumu+FrJD8yv3cB5TC7qeXMIq root@gthome3";
  };

  cloud = rec {
    openssh-pub.vultr = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIz+2YjcxpmNnUwaf3pwxot0T4eiG80t34ihyfUkWZiq root@nixos-cloud";
  };
}
