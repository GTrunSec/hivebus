# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  GodTian_Pinyin = {
    pname = "GodTian_Pinyin";
    version = "e21e41510b6d440389966bb0b2a70b38fafc6741";
    src = fetchFromGitHub ({
      owner = "whatbeg";
      repo = "GodTian_Pinyin";
      rev = "e21e41510b6d440389966bb0b2a70b38fafc6741";
      fetchSubmodules = false;
      sha256 = "sha256-uSrj+hwai7fSJN7SWL5u80hp8nSzJ4XI5t/8s19uoV8=";
    });
    date = "2017-07-19";
  };
  acm-terminal = {
    pname = "acm-terminal";
    version = "321e05fc0398a6159925b858f46608ea07ef269e";
    src = fetchFromGitHub ({
      owner = "twlz0ne";
      repo = "acm-terminal";
      rev = "321e05fc0398a6159925b858f46608ea07ef269e";
      fetchSubmodules = false;
      sha256 = "sha256-Flw07EwH9z0E3tqXs4mStICJmoHfp60ALrP1GmUmeuU=";
    });
    date = "2023-02-15";
  };
  jinx = {
    pname = "jinx";
    version = "22b13fecf3d8c7b30b288e0642edc22015e5fda0";
    src = fetchFromGitHub ({
      owner = "minad";
      repo = "jinx";
      rev = "22b13fecf3d8c7b30b288e0642edc22015e5fda0";
      fetchSubmodules = false;
      sha256 = "sha256-9xemcO7yqtxztpX2EALvIB3BX9KUyIfqb2jVr1Hgiz0=";
    });
    date = "2023-03-31";
  };
  lsp-bridge = {
    pname = "lsp-bridge";
    version = "805d10a9e93c41e38f846e015178613afc4470dd";
    src = fetchFromGitHub ({
      owner = "manateelazycat";
      repo = "lsp-bridge";
      rev = "805d10a9e93c41e38f846e015178613afc4470dd";
      fetchSubmodules = false;
      sha256 = "sha256-oWlTvq8fPTsdKxCm22psNfzmpwbjoniPXq4PNrw1TQY=";
    });
    date = "2023-03-31";
  };
}
