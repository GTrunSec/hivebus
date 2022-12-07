;;; compile.el --- description -*- lexical-binding: t; -*-
(require 'org)
(org-babel-tangle-file "nix.org")
(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))
