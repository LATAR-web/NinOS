{ pkgs, ... }:
{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Crucial para instrumentos y producción musical

    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.rate = 48000;
        default.clock.quantum = 128;
        default.clock.min-quantum = 32;
        default.clock.max-quantum = 512;
      };
    };
  };

  users.extraGroups.realtime = {};

  environment.systemPackages = with pkgs; [
    qpwgraph
    carla
    easyeffects
  ];
}
