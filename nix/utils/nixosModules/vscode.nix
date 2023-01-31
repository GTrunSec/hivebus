{pkgs, ...}: let
  customVscode = pkgs.vscode-with-extensions.override {
    # When the extension is already available in the default extensions set.
    vscodeExtensions = with pkgs.vscode-extensions;
      [
        # bbenoist
        # nickel-syntax
        # multi-cursor-case-preserve
        # # theme
        # tokyo-night
        # vscode-emacs-friendly
        # zeek
        # indent-rainbow
        # readable-indent
        # # Julia
        # julia-color-themes
        # language-julia
        # pdf
        # vscode-markdownlint
        # markdown-preview-enhanced
        tomoki1207.pdf
        kubukoz.nickel-syntax
        cardinal90.multi-cursor-case-preserve
        lfs.vscode-emacs-friendly
        enkia.tokyo-night
        davidanson.vscode-markdownlint
        bpmn-io.vs-code-bpmn-io
        mkhl.direnv
        github.copilot
        rust-lang.rust-analyzer
        julialang.language-julia
        cameronbieganek.julia-color-themes
      ]
      # Concise version from the vscode market place when not available in the default set.
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [];
  };
in {
  environment.systemPackages = with pkgs; [
    customVscode
  ];
}
