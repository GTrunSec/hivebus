{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
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
        Preferences = {
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.urlbar.autoFill.adaptiveHistory.enabled" = true;
          "browser.tabs.closeWindowWithLastTab" = false;
          "extensions.unifiedExtensions.enabled" = false;
        };
      };
    };
    profiles.default.extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      vimium
      darkreader
      privacy-badger
    ];
  };
}
