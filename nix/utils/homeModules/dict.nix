{pkgs, ...}: {
  home.file.".config/enchant/enenchant.ordering".source = pkgs.writeText "enenchant.ordering" ''
    *:aspell,hunspell,nuspell
  '';
  home.packages = with pkgs; [
    (
      hunspellWithDicts [
        hunspellDicts.en-us
      ]
    )
    (aspellWithDicts (dicts:
      with dicts; [
        en
        en-computers
        en-science
      ]))
  ];
}
