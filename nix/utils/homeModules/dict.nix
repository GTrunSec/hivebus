{
  pkgs,
  lib,
  ...
}: let
  ordering = lib.concatStringsSep "," ((lib.optionals pkgs.stdenv.isDarwin ["AppleSpell"])
    ++ [
      "aspell"
      "hunspell"
      "nuspell"
    ]);
in {
  home.file.".config/enchant/enenchant.ordering".source = pkgs.writeText "enenchant.ordering" ''
    *:${ordering}
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
