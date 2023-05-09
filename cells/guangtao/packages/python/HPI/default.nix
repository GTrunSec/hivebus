{
  lib,
  python3Packages,
  fetchurl,
  guangtao-sources,
}:
with python3Packages;
  python3Packages.buildPythonPackage rec {
    inherit (guangtao-sources.HPI) pname version src;

    propagatedBuildInputs = with python3Packages; [
      pandas
      appdirs
      more-itertools
      mypy
      decorator
      setuptools_scm
      click
    ];

    makeWrapperArgs = ["--prefix PYTHONPATH : $PYTHONPATH"];

    doCheck = false;

    meta = with lib; {
      description = "Human Programming Interface 🧑👽🤖";
      homepage = "https://github.com/karlicoss/HPI";
      license = licenses.asl20;
      maintainers = with maintainers; [gtrunsec];
    };
  }
