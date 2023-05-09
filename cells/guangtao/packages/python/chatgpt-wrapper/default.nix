{
  lib,
  python3Packages,
  fetchurl,
  guangtao-sources,
}:
with python3Packages;
  python3Packages.buildPythonPackage rec {
    inherit (guangtao-sources.chatgpt-wrapper) pname version src;

    propagatedBuildInputs = with python3Packages; [
      playwright
      gnureadline
      rich
    ];

    patches = [./linux.patch];

    doCheck = false;
  }
