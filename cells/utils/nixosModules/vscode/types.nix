{lib}:
with lib; {
  programs.vscode = {
    hiveProfiles = mkOption {
      default = {};
      type = types.submodule {
        options = {
          rust = mkEnableOption (lib.mdDoc "Whether to enable rust packages");
          julia = mkEnableOption (lib.mdDoc "Whether to enable julia packages");
          markdown = mkEnableOption (lib.mdDoc "Whether to enable markdown packages");
          bpmn = mkEnableOption (lib.mdDoc "Whether to enable bpmn packages");
          nickel = mkEnableOption (lib.mdDoc "Whether to enable nickel packages");
        };
      };
    };
  };
}
