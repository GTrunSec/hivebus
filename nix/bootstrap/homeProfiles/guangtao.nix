{
  inputs,
  cell,
}: {
  imports = [
    cell.homeProfiles.default
  ];
  programs.git = {
    userEmail = "gtrunsec@hardenedlinux.org";
    userName = "guangtao";
    ignores = [
      ".projectile"
      ".indium.json"
      ".ccls-cache"
      ".Rhistory"
      ".notdeft*"
      "eaf"
      ".auctex-auto"
      "vast.db"
      ".DS_Store"
      "result"
      ".ipynb_checkpoints"
      "__pycache__"
      "*.org.organice-bak"
      ".direnv"
      ".direnv.d"
      ".secrets"
      ".cargo"
    ];
  };
}
