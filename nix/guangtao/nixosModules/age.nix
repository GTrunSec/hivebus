({config, ...}: {
  age.secrets.root-user.file = ../secretProfiles/root-user.age;
  users.users.root = {
    passwordFile = config.age.secrets.root-user.path;
  };
})
