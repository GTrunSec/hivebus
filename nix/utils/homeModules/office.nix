{pkgs, ...}: {
  home.packages = with pkgs; [
    onlyoffice-bin

    foliate # epub reader
    okular # pdf reader
  ];
}
