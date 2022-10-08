{
  inputs,
  system ? "x86_64-linux",
}: let
  l = inputs.nixpkgs.lib // builtins;
  colmena = let
    inherit (l.attrsets) foldAttrs recursiveUpdate mapAttrsToList mapAttrs';
    inherit (l.lists) optionals flatten map;

    collect = x:
      foldAttrs recursiveUpdate {
      } (flatten (mapAttrsToList (
          cell: cells:
            optionals (cells ? colmenaConfigurations)
            (map (mapAttrs' (name: value: {
              name =
                if name != "meta"
                then "${cell}-o-${name}"
                else name;
              value =
                if name == "meta" && (value ? nodeNixpkgs)
                then
                  (
                    value
                    // {
                      nixpkgs = import inputs.nixpkgs {
                        inherit system;
                      };
                      nodeNixpkgs =
                        mapAttrs' (
                          name: value: {
                            name = "${cell}-o-${name}";
                            inherit value;
                          }
                        )
                        value.nodeNixpkgs;
                    }
                  )
                else value;
            })) (l.attrValues cells.colmenaConfigurations))
        )
        x));
  in
    # exports have no system, pick one
    collect inputs.self.${system};
in
  colmena
