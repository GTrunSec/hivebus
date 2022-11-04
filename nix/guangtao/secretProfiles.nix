{
  inputs,
  cell,
}: {
  guangtao = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTQ1V9mjPZY31h55Jl6nl7VBxl6cQgag9+s8kvJSEpZ NixOS-gtrun-14-05-2021"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDI2uDp51HMggnfz4Zn5ky4gb/XVdQiJR7pZyb/LcCLx macOSdeMBP.attlocal.net-gtrun-14-05-2021"
    ];
  };
}
