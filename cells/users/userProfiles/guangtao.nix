{
  root,
  lib,
}: {
  users.users = {
    "guangtao" = {
      hashedPassword = "$6$iv9bE8EVny10wamj$CS7uxN8/QeLSIMKZGwN2X2OHKSIY8xxCDrXVkwKokPW4xMGdFGuQ6SSC8UJ9GcUFX2BQizE6k3yv8vUFyH2XA/";
      description = "default";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        # "audio"
        # "video"
      ];
      openssh.authorizedKeys.keys = lib.attrValues root.openssh;
    };
  };
}
