{ pkgs, systemInformation, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General.ControllerMode = "bredr";
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  home-manager.users."${systemInformation.userName}" =
    { ... }:
    {
      home.packages = with pkgs; [ brightnessctl ];
    };
}
