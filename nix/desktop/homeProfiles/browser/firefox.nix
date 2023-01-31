{
  inputs,
  cell,
}: let
  inherit (inputs.nixos) legacyPackages;
in {
  programs.firefox = {
    package = legacyPackages.wrapFirefox legacyPackages.firefox-unwrapped {
      extraPolicies = {
        PasswordManagerEnabled = false;
        DisableFirefoxAccounts = true;
        DisablePocket = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };
  };
}
