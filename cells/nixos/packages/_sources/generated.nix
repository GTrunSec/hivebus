# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  HPI = {
    pname = "HPI";
    version = "0.3.20230327";
    src = fetchurl {
      url = "https://pypi.org/packages/source/H/HPI/HPI-0.3.20230327.tar.gz";
      sha256 = "sha256-0QkuK8hzJL/KzZmgNSjZ+Ts6lJcmYNmSsj8cofG5/Wk=";
    };
  };
  StevenBlack-hosts = {
    pname = "StevenBlack-hosts";
    version = "343eec32afd1d15a60c87a90773ccd56c8d32215";
    src = fetchFromGitHub {
      owner = "StevenBlack";
      repo = "hosts";
      rev = "343eec32afd1d15a60c87a90773ccd56c8d32215";
      fetchSubmodules = false;
      sha256 = "sha256-zlyzd+lqP+bFGrIqhAftgG4FNc07VaMMubm8XL9FquM=";
    };
    date = "2023-06-13";
  };
  adguardhome = {
    pname = "adguardhome";
    version = "v0.107.32";
    src = fetchurl {
      url = "https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.32/AdGuardHome_linux_amd64.tar.gz";
      sha256 = "sha256-YBE4yL63Ee1UmkE7pIbLKOLLhiY5DpN1t8i/ovQOKXo=";
    };
  };
  brave = {
    pname = "brave";
    version = "1.52.122";
    src = fetchurl {
      url = "https://github.com/brave/brave-browser/releases/download/v1.52.122/brave-browser_1.52.122_amd64.deb";
      sha256 = "sha256-TX/wbsfIv1Ymk7pnn2GcurEulZbnIkiNRnvrqnRBRVw=";
    };
  };
  chord = {
    pname = "chord";
    version = "0.2.38";
    src = fetchurl {
      url = "https://github.com/PeterDing/chord/releases/download/v0.2.38/chord-0.2.38-linux-x86_64.AppImage";
      sha256 = "sha256-14rkxceyS0OwnOK14rICWnzLLkRB8dmqRkPq829znws=";
    };
  };
  drawio = {
    pname = "drawio";
    version = "21.3.7";
    src = fetchurl {
      url = "https://github.com/jgraph/drawio-desktop/releases/download/v21.3.7/drawio-x86_64-21.3.7.rpm";
      sha256 = "sha256-ADErVhMOpcTPUnAw3AelTfXEmdsegSQDyhS6mA3qu3c=";
    };
  };
  hug = {
    pname = "hug";
    version = "2.6.1";
    src = fetchurl {
      url = "https://pypi.org/packages/source/h/hug/hug-2.6.1.tar.gz";
      sha256 = "sha256-sO2s4qy2GIc3ecnObs+RZdtU/vlcIiYvVwD83Z/rrsk=";
    };
  };
  logseq = {
    pname = "logseq";
    version = "0.9.9";
    src = fetchurl {
      url = "https://github.com/logseq/logseq/releases/download/0.9.9/logseq-linux-x64-0.9.9.AppImage";
      sha256 = "sha256-DwxRhC8HKJnu1F9mfU3+UdpTjtKLhxs4LJY9A0cZvBo=";
    };
  };
  logseq-darwin = {
    pname = "logseq-darwin";
    version = "0.9.9";
    src = fetchurl {
      url = "https://github.com/logseq/logseq/releases/download/0.9.9/logseq-darwin-x64-0.9.9.dmg";
      sha256 = "sha256-qmTOHfoIYxqbcJsIg5sBN/7PU7+WQXLtDYCGyrMMReA=";
    };
  };
  magnetw = {
    pname = "magnetw";
    version = "3.1.1";
    src = fetchurl {
      url = "https://github.com/xiandanin/magnetW/releases/download/3.1.1/magnetw-3.1.1-linux.AppImage";
      sha256 = "sha256-ie6XGdd/HQCxIaLY5gGOgOXCHDJxcnaxgaO7plA5Eh8=";
    };
  };
  motrix = {
    pname = "motrix";
    version = "1.8.19";
    src = fetchurl {
      url = "https://github.com/agalwood/Motrix/releases/download/v1.8.19/Motrix-1.8.19.AppImage";
      sha256 = "sha256-oSO+VH3bZcjnXjECqZgOmsvlOONbfgOq50qVLvHdKfo=";
    };
  };
  orgparse = {
    pname = "orgparse";
    version = "0.3.2";
    src = fetchurl {
      url = "https://pypi.org/packages/source/o/orgparse/orgparse-0.3.2.tar.gz";
      sha256 = "sha256-RRBQ55rLelHGXcmbkJXq5NUL1ZhUE1T552PLTL31mlU=";
    };
  };
  promnesia = {
    pname = "promnesia";
    version = "3c33b6a2c7ee81b897e20c05e2dccbb0a5a0a49f";
    src = fetchFromGitHub {
      owner = "karlicoss";
      repo = "promnesia";
      rev = "3c33b6a2c7ee81b897e20c05e2dccbb0a5a0a49f";
      fetchSubmodules = false;
      sha256 = "sha256-m+H47FyaRslROPAKCpjA9t8kI3qVBoqDKBFkPnDOTCk=";
    };
    date = "2023-05-14";
  };
  spaceship-prompt = {
    pname = "spaceship-prompt";
    version = "8461d88f59536087bbccd383d1c5da82e9fb90b3";
    src = fetchFromGitHub {
      owner = "spaceship-prompt";
      repo = "spaceship-prompt";
      rev = "8461d88f59536087bbccd383d1c5da82e9fb90b3";
      fetchSubmodules = false;
      sha256 = "sha256-gt9CuEHkjlsrc3svLh44L1SZA4OtIhcrFET9d2gJiLM=";
    };
    date = "2023-05-23";
  };
}
