{
  guangtao = rec {
    openssl.desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTQ1V9mjPZY31h55Jl6nl7VBxl6cQgag9+s8kvJSEpZ NixOS-gtrun-14-05-2021";
    openssl.macos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDI2uDp51HMggnfz4Zn5ky4gb/XVdQiJR7pZyb/LcCLx macOSdeMBP.attlocal.net-gtrun-14-05-2021";
    openssl.new = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIASgkMbXa+U0AgchM3wkmjHPkB80Ypyl723Bxgt36Ytr Desktop-guangtao-06-01-2023";
    openssh.authorizedKeys.keys = [
      openssl.macos
      openssl.desktop
      openssl.new
    ];
  };
  libvirtd = rec {
    openssl.home3 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIg3koyHGJ14H1Cmy2gyumu+FrJD8yv3cB5TC7qeXMIq root@gthome3";
  };
}
