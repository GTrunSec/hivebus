{
  inputs,
  cell,
}: {
  config,
  pkgs,
  ...
}: let
  inherit (inputs) std self;
  src = "${(std.incl self ["profiles/doom-emacs"])}/profiles/doom-emacs";
  onChange = ''
    export PATH=/run/current-system/etc/profiles/per-user/$USER/bin/:${pkgs.emacs}/bin:$PATH
    $HOME/.emacs.d/bin/doom sync
  '';
in {
  home.file.".doom.d/config.org" = {
    source = src + "/config.org";
    inherit onChange;
  };

  home.file.".doom.d/meow.org" = {
    source = src + "/meow.org";
    inherit onChange;
  };
}
