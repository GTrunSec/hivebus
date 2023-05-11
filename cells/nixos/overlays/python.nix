{
  inputs,
  cell,
}: final: prev: {
  promnesia = prev.python3Packages.callPackage ../packages/python/promnesia {
    orgparse = final.orgparse;
    hpi = final.hpi;
  };
  orgparse = prev.python3Packages.callPackage ../packages/python/orgparse {};
  hpi = prev.pythonPackages.callPackage ../packages/python/HPI {};
  # chatgpt-wrapper = prev.python3Packages.callPackage ../packages/python/chatgpt-wrapper {};
}
