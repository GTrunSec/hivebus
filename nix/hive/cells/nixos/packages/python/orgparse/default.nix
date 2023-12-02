{
  lib,
  python3Packages,
  fetchurl,
  guangtao-sources,
}:
with python3Packages;
python3Packages.buildPythonPackage rec {
  inherit (guangtao-sources.orgparse) pname version src;

  propagatedBuildInputs = with python3Packages; [setuptools_scm];

  doCheck = false;

  meta = with lib; {
    description = "Python module for reading Emacs org-mode files";
    homepage = "https://github.com/karlicoss/orgparse";
    license = licenses.asl20;
    maintainers = with maintainers; [gtrunsec];
  };
}
