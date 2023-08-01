_:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg' = config.programs.vscode.hive;
in
{
  options = import ./_types.nix { inherit lib; };
  config = with lib; {
    environment.systemPackages = with pkgs; [
      (pkgs.vscode-with-extensions.override {
        # When the extension is already available in the default extensions set.
        vscodeExtensions =
          with pkgs.vscode-extensions;
          [
            tomoki1207.pdf
            cardinal90.multi-cursor-case-preserve
            lfs.vscode-emacs-friendly
            enkia.tokyo-night
            mkhl.direnv
            github.copilot
          ]
          ++ optionals cfg'.julia [
            julialang.language-julia
            cameronbieganek.julia-color-themes
          ]
          ++ optionals cfg'.rust [ rust-lang.rust-analyzer ]
          ++ optionals cfg'.bpmn [
            redhat.vscode-extension-dmn-editor
            redhat.vscode-extension-bpmn-editor
          ]
          ++ optionals cfg'.markdown [
            davidanson.vscode-markdownlint
            shd101wyy.markdown-preview-enhanced
          ]
          ++ optionals cfg'.nickel [ kubukoz.nickel-syntax ]
          # Concise version from the vscode market place when not available in the default set.
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [ ]
        ;
      })
    ];
  };
}
