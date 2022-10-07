{
  inputs,
  exports,
}: let
  l = inputs.nixpkgs.lib // builtins;
  colmena = let
    inherit (l.attrsets) foldAttrs recursiveUpdate mapAttrsToList mapAttrs';
    inherit (l.lists) optionals flatten map;

    collect = x:
      foldAttrs recursiveUpdate {} (flatten (mapAttrsToList (
          cell: organelles:
            optionals (organelles ? colmenaConfigurations)
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
            })) (l.attrValues organelles.colmenaConfigurations))
        )
        x));
  in
    collect exports;
in
  colmena
