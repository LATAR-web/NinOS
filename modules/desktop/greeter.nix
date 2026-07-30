{ inputs, pkgs, ... }:
{
  imports = [ inputs.noctalia-greeter.nixosModules.default ];

  # Necesario para que el greeter muestre tu avatar de usuario.
  services.accounts-daemon.enable = true;

  programs.noctalia-greeter = {
    enable = true;
    settings = {
      keyboard = {
        layout = "latam";
      };
      # Sesión que se preselecciona en el picker de login.
      session.default = "niri";
    };
  };
}
