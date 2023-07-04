_: {
  pkgs,
  lib,
  config,
  ...
}: let
  treeSitterPlugins = with pkgs.tree-sitter-grammars; [
    tree-sitter-nickel
    tree-sitter-nix
    tree-sitter-markdown

    tree-sitter-bash
    tree-sitter-julia
    tree-sitter-c
    tree-sitter-elisp
    tree-sitter-c-sharp
    tree-sitter-cmake
    tree-sitter-cpp
    tree-sitter-css
    tree-sitter-dockerfile
    tree-sitter-go
    tree-sitter-gomod
    tree-sitter-html
    tree-sitter-java
    tree-sitter-javascript
    tree-sitter-json
    tree-sitter-python
    tree-sitter-ruby
    tree-sitter-rust
    tree-sitter-toml
    tree-sitter-tsx
    tree-sitter-typescript
    tree-sitter-yaml
  ];
  lib' = drv: let
    libName = drv: pkgs.lib.removeSuffix "-grammar" drv.pname;
    libSuffix =
      if pkgs.stdenv.isDarwin
      then "dylib"
      else "so";
  in ''lib${libName drv}.${libSuffix}'';

  linkCmd = drv:
    if pkgs.stdenv.isDarwin
    then ''
      cp ${drv}/parser .
      chmod +w ./parser
      install_name_tool -id $out/lib/${lib' drv} ./parser
      cp ./parser $out/lib/${lib' drv}
      ${pkgs.darwin.sigtool}/bin/codesign -s - -f $out/lib/${lib' drv}
    ''
    else ''ln -s ${drv}/parser $out/lib/${lib' drv}'';

  tree-sitter-grammars =
    pkgs.runCommandCC "tree-sitter-grammars" {}
    (lib.concatStringsSep "\n" (["mkdir -p $out/lib"] ++ (map linkCmd treeSitterPlugins)));
in {
  config = with lib;
    mkMerge [
      {
        home.activation.linkEmacsTreeSitter = config.lib.dag.entryAfter ["writeBoundary"] ''
          ln -sfT ${tree-sitter-grammars}/lib $HOME/.emacs.d/.local/cache/tree-sitter
        '';
      }
      (mkIf pkgs.stdenv.isLinux {
        programs.emacs = {
          enable = true;
          package = mkForce (pkgs.emacs-pgtk.override {
            withTreeSitter = true;
          });
        };
      })
    ];
}
