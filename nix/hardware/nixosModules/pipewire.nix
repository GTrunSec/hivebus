{...}: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
