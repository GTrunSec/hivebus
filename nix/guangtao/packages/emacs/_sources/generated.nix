# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  GodTian_Pinyin = {
    pname = "GodTian_Pinyin";
    version = "e21e41510b6d440389966bb0b2a70b38fafc6741";
    src = fetchFromGitHub {
      owner = "whatbeg";
      repo = "GodTian_Pinyin";
      rev = "e21e41510b6d440389966bb0b2a70b38fafc6741";
      fetchSubmodules = false;
      sha256 = "sha256-uSrj+hwai7fSJN7SWL5u80hp8nSzJ4XI5t/8s19uoV8=";
    };
    date = "2017-07-19";
  };
  acm-terminal = {
    pname = "acm-terminal";
    version = "321e05fc0398a6159925b858f46608ea07ef269e";
    src = fetchFromGitHub {
      owner = "twlz0ne";
      repo = "acm-terminal";
      rev = "321e05fc0398a6159925b858f46608ea07ef269e";
      fetchSubmodules = false;
      sha256 = "sha256-Flw07EwH9z0E3tqXs4mStICJmoHfp60ALrP1GmUmeuU=";
    };
    date = "2023-02-15";
  };
  jinx = {
    pname = "jinx";
    version = "d4280cb6e8e12822334c92d0f94cda6eb8f76d96";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "jinx";
      rev = "d4280cb6e8e12822334c92d0f94cda6eb8f76d96";
      fetchSubmodules = false;
      sha256 = "sha256-nLyR7s0n1bPmnSSL9afLAI9Wt6jprxtFuEbirczYrtY=";
    };
    date = "2023-04-24";
  };
  lsp-bridge = {
    pname = "lsp-bridge";
    version = "c44b9e5e39f0696c2d15e6ec9c93f1dabb163c19";
    src = fetchFromGitHub {
      owner = "manateelazycat";
      repo = "lsp-bridge";
      rev = "c44b9e5e39f0696c2d15e6ec9c93f1dabb163c19";
      fetchSubmodules = false;
      sha256 = "sha256-AdHQwa/zdNifjMUCp1oGS2RhHdydlUDBzlsJ2K5aLI4=";
    };
    date = "2023-04-25";
  };
}
