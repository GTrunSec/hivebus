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
    version = "0dbbd7f401da1bedd1a9146df6127233d601435b";
    src = fetchFromGitHub {
      owner = "twlz0ne";
      repo = "acm-terminal";
      rev = "0dbbd7f401da1bedd1a9146df6127233d601435b";
      fetchSubmodules = false;
      sha256 = "sha256-Opouy9A6z0YUT1zxZq1yHx+r/hwNE93JDwfa1fMWNgc=";
    };
    date = "2023-06-01";
  };
  jinx = {
    pname = "jinx";
    version = "5e80f9839bb1ad51dbf96d6e5bbe1bc2648d8822";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "jinx";
      rev = "5e80f9839bb1ad51dbf96d6e5bbe1bc2648d8822";
      fetchSubmodules = false;
      sha256 = "sha256-eLX4WwgCqEIBnO5KxLoN+pxc5lIOxG2Iczttx02PHas=";
    };
    date = "2023-09-21";
  };
  lsp-bridge = {
    pname = "lsp-bridge";
    version = "e37e962d108889fbba93c926788766f73aa54e6a";
    src = fetchFromGitHub {
      owner = "manateelazycat";
      repo = "lsp-bridge";
      rev = "e37e962d108889fbba93c926788766f73aa54e6a";
      fetchSubmodules = false;
      sha256 = "sha256-1NxJgaEfYX7dsOx75zmMwsXyvSEftA44auwKtcOVE5k=";
    };
    date = "2023-09-18";
  };
}
