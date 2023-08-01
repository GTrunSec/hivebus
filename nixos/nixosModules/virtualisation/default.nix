{ lib, inputs }:
let
  inherit (inputs) haumea;
in
{
  _imports = lib.attrValues (
    haumea.lib.load {
      src = ./__config;
      loader = haumea.lib.loaders.path;
    }
  );
  _options.hive = with lib; {
    gui = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable the gui profile";
    };
    dockerCompose = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable the docker-compose profile";
    };
    user = mkOption {
      type = types.str;
      default = "";
      description = "The user to run the virtualization programs as";
    };
    nvidia = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable the nvidia profile";
    };
  };
}
