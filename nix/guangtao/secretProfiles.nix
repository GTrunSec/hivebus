{
  guangtao = rec {
    openssl.macos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDI2uDp51HMggnfz4Zn5ky4gb/XVdQiJR7pZyb/LcCLx macOSdeMBP.attlocal.net-gtrun-14-05-2021";
    openssl.desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLxc7EBr1Qi4M65O1KjXZf4bOBZMQ6YeDSFYzKzFan7 Desktop-guangtao-03-02-2023";
    openssl.macbook = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK1QW0lG58r6yaI9xMQ+D5XA7RUQF8lfBanNs36Wrlw guangtaos-MBP.attlocal.net-guangtao-21-02-2023";
    openssh.authorizedKeys.keys = [
      openssl.macos
      openssl.desktop
      openssl.macbook
    ];
  };
  libvirtd = rec {
    openssl.home3 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIg3koyHGJ14H1Cmy2gyumu+FrJD8yv3cB5TC7qeXMIq root@gthome3";
  };
}
