# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
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
    version = "9a7122c894b14f0d625ac183db657075c9438cc7";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "jinx";
      rev = "9a7122c894b14f0d625ac183db657075c9438cc7";
      fetchSubmodules = false;
      sha256 = "sha256-kEpT7qNmGH1Rfus7kt+3J6bBGJM98H1SB52hWLs26Pc=";
    };
    date = "2023-05-17";
  };
  lsp-bridge = {
    pname = "lsp-bridge";
    version = "d82f78c60ea7b0c7b03d57e15c1905b8d651783e";
    src = fetchFromGitHub {
      owner = "manateelazycat";
      repo = "lsp-bridge";
      rev = "d82f78c60ea7b0c7b03d57e15c1905b8d651783e";
      fetchSubmodules = false;
      sha256 = "sha256-g35He/t1cpJxczinaM++LbzoRQn1xVZNL2UPMvYUqpA=";
    };
    date = "2023-05-15";
  };
}
