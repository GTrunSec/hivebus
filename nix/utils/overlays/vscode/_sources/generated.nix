# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  copilot = {
    pname = "copilot";
    version = "1.73.8685";
    src = fetchurl {
      url = "https://GitHub.gallery.vsassets.io/_apis/public/gallery/publisher/GitHub/extension/copilot/1.73.8685/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "copilot-1.73.8685.zip";
      sha256 = "sha256-W1j1VAuSM1sgxHRIahqVncUlknT+MPi7uutY+0NURZQ=";
    };
    name = "copilot";
    publisher = "Github";
  };
  direnv = {
    pname = "direnv";
    version = "0.10.1";
    src = fetchurl {
      url = "https://mkhl.gallery.vsassets.io/_apis/public/gallery/publisher/mkhl/extension/direnv/0.10.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "direnv-0.10.1.zip";
      sha256 = "sha256-Da9Anme6eoKLlkdYaeLFDXx0aQgrtepuUnw2jEPXCVU=";
    };
    name = "direnv";
    publisher = "mkhl";
  };
  indent-rainbow = {
    pname = "indent-rainbow";
    version = "8.3.1";
    src = fetchurl {
      url = "https://oderwat.gallery.vsassets.io/_apis/public/gallery/publisher/oderwat/extension/indent-rainbow/8.3.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "indent-rainbow-8.3.1.zip";
      sha256 = "sha256-dOicya0B2sriTcDSdCyhtp0Mcx5b6TUaFKVb0YU3jUc=";
    };
    name = "indent-rainbow";
    publisher = "oderwat";
  };
  julia = {
    pname = "julia";
    version = "1.41.1";
    src = fetchurl {
      url = "https://julialang.gallery.vsassets.io/_apis/public/gallery/publisher/julialang/extension/language-julia/1.41.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "language-julia-1.41.1.zip";
      sha256 = "sha256-h/8/YcqaJgL8GiqXBBXMQ5TSYU7Rn/hr39jPvyfL1KA=";
    };
    name = "language-julia";
    publisher = "julialang";
  };
  julia-color-themes = {
    pname = "julia-color-themes";
    version = "0.1.1";
    src = fetchurl {
      url = "https://cameronbieganek.gallery.vsassets.io/_apis/public/gallery/publisher/cameronbieganek/extension/julia-color-themes/0.1.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "julia-color-themes-0.1.1.zip";
      sha256 = "sha256-22TA7RpC0W3G8uA4EIqeuB4gqDF9cr1gNS+u7qQ3IaA=";
    };
    name = "julia-color-themes";
    publisher = "cameronbieganek";
  };
  markdown-preview-enhanced = {
    pname = "markdown-preview-enhanced";
    version = "0.6.7";
    src = fetchurl {
      url = "https://shd101wyy.gallery.vsassets.io/_apis/public/gallery/publisher/shd101wyy/extension/markdown-preview-enhanced/0.6.7/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "markdown-preview-enhanced-0.6.7.zip";
      sha256 = "sha256-5tgxpjkpbgv8HcfLBbDcOOEd8swinK5iHtnO34892ik=";
    };
    name = "markdown-preview-enhanced";
    publisher = "shd101wyy";
  };
  multi-cursor-case-preserve = {
    pname = "multi-cursor-case-preserve";
    version = "1.0.5";
    src = fetchurl {
      url = "https://Cardinal90.gallery.vsassets.io/_apis/public/gallery/publisher/Cardinal90/extension/multi-cursor-case-preserve/1.0.5/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "multi-cursor-case-preserve-1.0.5.zip";
      sha256 = "sha256-eJafjYDydD8DW83VLH9MPFeDENXBx3el7XvjZqu88Jw=";
    };
    name = "multi-cursor-case-preserve";
    publisher = "Cardinal90";
  };
  nickel-syntax = {
    pname = "nickel-syntax";
    version = "0.0.2";
    src = fetchurl {
      url = "https://kubukoz.gallery.vsassets.io/_apis/public/gallery/publisher/kubukoz/extension/nickel-syntax/0.0.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "nickel-syntax-0.0.2.zip";
      sha256 = "sha256-ffPZd717Y2OF4d9MWE6zKwcsGWS90ZJvhWkqP831tVM=";
    };
    name = "kubukoz";
    publisher = "nickel-syntax";
  };
  pdf = {
    pname = "pdf";
    version = "1.2.2";
    src = fetchurl {
      url = "https://tomoki1207.gallery.vsassets.io/_apis/public/gallery/publisher/tomoki1207/extension/pdf/1.2.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "pdf-1.2.2.zip";
      sha256 = "sha256-i3Rlizbw4RtPkiEsodRJEB3AUzoqI95ohyqZ0ksROps=";
    };
    name = "pdf";
    publisher = "tomoki1207";
  };
  readable-indent = {
    pname = "readable-indent";
    version = "1.2.2";
    src = fetchurl {
      url = "https://cnojima.gallery.vsassets.io/_apis/public/gallery/publisher/cnojima/extension/readable-indent/1.2.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "readable-indent-1.2.2.zip";
      sha256 = "sha256-iTgbxasaNTIBlLLUPs00Y9x099zfXc6ES6drTc8CE78=";
    };
    name = "readable-indent";
    publisher = "cnojima";
  };
  rust = {
    pname = "rust";
    version = "0.7.9";
    src = fetchurl {
      url = "https://rust-lang.gallery.vsassets.io/_apis/public/gallery/publisher/rust-lang/extension/rust/0.7.9/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "rust-0.7.9.zip";
      sha256 = "sha256-2uV+s//4fAEuibNHjSJop4pdf9KpDHsICDNWmdjJVSs=";
    };
    name = "rust";
    publisher = "rust-lang";
  };
  rust-analyzer = {
    pname = "rust-analyzer";
    version = "0.4.1408";
    src = fetchurl {
      url = "https://rust-lang.gallery.vsassets.io/_apis/public/gallery/publisher/rust-lang/extension/rust-analyzer/0.4.1408/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "rust-analyzer-0.4.1408.zip";
      sha256 = "sha256-sacetNrPcR3uBFQaBpi0e2znwP38bsh92WUXM9rnEFk=";
    };
    name = "rust-analyzer";
    publisher = "rust-lang";
  };
  tokyo-night = {
    pname = "tokyo-night";
    version = "0.9.7";
    src = fetchurl {
      url = "https://enkia.gallery.vsassets.io/_apis/public/gallery/publisher/enkia/extension/tokyo-night/0.9.7/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "tokyo-night-0.9.7.zip";
      sha256 = "sha256-SLo+Vf4ttOhUjKP8UTJC2C01vduSkdutLFucqht++vg=";
    };
    name = "tokyo-night";
    publisher = "enkia";
  };
  vscode-emacs-friendly = {
    pname = "vscode-emacs-friendly";
    version = "0.9.0";
    src = fetchurl {
      url = "https://lfs.gallery.vsassets.io/_apis/public/gallery/publisher/lfs/extension/vscode-emacs-friendly/0.9.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "vscode-emacs-friendly-0.9.0.zip";
      sha256 = "sha256-YWu2a5hz0qGZvgR95DbzUw6PUvz17i1o4+eAUM/xjMg=";
    };
    name = "vscode-emacs-friendly";
    publisher = "lfs";
  };
  vscode-extension-bpmn-editor = {
    pname = "vscode-extension-bpmn-editor";
    version = "0.26.0";
    src = fetchurl {
      url = "https://redhat.gallery.vsassets.io/_apis/public/gallery/publisher/redhat/extension/vscode-extension-bpmn-editor/0.26.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "vscode-extension-bpmn-editor-0.26.0.zip";
      sha256 = "sha256-42zaQCvlEZHo0Flmk/y33XnzDvXKSY/4pd+3oUb/EQ4=";
    };
    name = "vscode-extension-bpmn-editor";
    publisher = "redhat";
  };
  vscode-extension-dmn-editor = {
    pname = "vscode-extension-dmn-editor";
    version = "0.26.0";
    src = fetchurl {
      url = "https://redhat.gallery.vsassets.io/_apis/public/gallery/publisher/redhat/extension/vscode-extension-dmn-editor/0.26.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "vscode-extension-dmn-editor-0.26.0.zip";
      sha256 = "sha256-OY5+z2lQPctpovLyJR7fd+uD5ll7TlXsNAOGMe0l+bs=";
    };
    name = "vscode-extension-dmn-editor";
    publisher = "redhat";
  };
  vscode-markdownlint = {
    pname = "vscode-markdownlint";
    version = "0.49.0";
    src = fetchurl {
      url = "https://DavidAnson.gallery.vsassets.io/_apis/public/gallery/publisher/DavidAnson/extension/vscode-markdownlint/0.49.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "vscode-markdownlint-0.49.0.zip";
      sha256 = "sha256-Mh/OoRK410aXEr3sK2CYFDsXGSqFT+JOWi9jHOdK01Y=";
    };
    name = "vscode-markdownlint";
    publisher = "DavidAnson";
  };
  zeek = {
    pname = "zeek";
    version = "0.6.0";
    src = fetchurl {
      url = "https://aeppert.gallery.vsassets.io/_apis/public/gallery/publisher/aeppert/extension/bro/0.6.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
      name = "bro-0.6.0.zip";
      sha256 = "sha256-+wISGCtGq/l058dOaAKlD3pGknP2ksekS1Rgmax5QgU=";
    };
    name = "bro";
    publisher = "aeppert";
  };
}
