{ inputs, pkgs, ... }:
{
  imports = [ inputs.noctalia.nixosModules.default ];

  programs.noctalia = {
    enable = true;
    # Habilita automáticamente NetworkManager, Bluetooth, UPower
    # y power-profiles-daemon, que Noctalia necesita para sus widgets.
    recommendedServices.enable = true;
  };

  # Cache binario oficial de Noctalia, para no compilar desde cero.
  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };
}
