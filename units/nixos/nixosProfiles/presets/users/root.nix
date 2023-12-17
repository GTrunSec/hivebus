{ inputs }:
let
  inherit (inputs.local) data;
  openssh.authorizedKeys.keys = [
    data.guangtao.openssh.public.desktop
    data.guangtao.openssh.public.macbook
  ];
in
{
  users.users."root" = {
    initialPassword = "root";
    # hashedPassword = "$6$iv9bE8EVny10wamj$CS7uxN8/QeLSIMKZGwN2X2OHKSIY8xxCDrXVkwKokPW4xMGdFGuQ6SSC8UJ9GcUFX2BQizE6k3yv8vUFyH2XA/";
    inherit openssh;
  };
}
