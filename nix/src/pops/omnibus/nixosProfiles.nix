omnibus.pops.nixosProfiles.addExporters [
  (POP.extendPop flops.haumea.pops.exporter (
    self: super: {
      exports.tiangang = self.outputs [
        inputs.self.hosts.tiangang.omnibus.nixosProfiles.disko
      ];

      exports.customModules = self.outputs [
        {
          value = {
            enable = false;
            customList = with inputs.dmerge; append [ "1" ];
            imports = with inputs.dmerge; append [ ];
          };
          path = [
            "services"
            "openssh"
          ];
        }
      ];
    }
  ))
]
