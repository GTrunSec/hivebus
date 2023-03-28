{
  homebrew.taps = [
    "homebrew/cask-fonts"
    "homebrew/cask"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/bundle"
    "homebrew/core"
    "d12frosted/emacs-plus"
  ];

  homebrew.casks =
    [
      "font-fantasque-sans-mono"
      "wez/wezterm/wezterm-nightly"
      # sudo xattr -rd com.apple.quarantine  /Applications/Koodo\ Reader.app
      "koodo-reader"
      "skim"
      "grammarly-desktop"
      "dropbox"
    ]
    ++ [
      "secretive"
    ];

  homebrew.brews =
    [
      "fontconfig"
      "coreutils"
      "emacs-plus@30"
      "rxvt-unicode"
      "libtool"
      "enchant"
    ]
    ++ [
    ];
}
