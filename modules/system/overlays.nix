{ pkgs, ... }:
{
  # ======================================================
  # Overlays — parches temporales a paquetes de nixpkgs rotos
  # ======================================================
  nixpkgs.overlays = [
    (final: prev: {
      # poetry 2.4.1 falla su test suite en este snapshot de unstable
      # (3 tests de test_executor.py rotos, bug del paquete, no nuestro).
      poetry = prev.poetry.overrideAttrs (old: {
        doCheck = false;
        doInstallCheck = false;
      });

      # scipy 1.18.0 falla un test de precisión numérica basado en
      # hypothesis (test_support_moments_sample), bug del paquete.
      python312 = prev.python312.override {
        packageOverrides = pyfinal: pyprev: {
          scipy = pyprev.scipy.overrideAttrs (old: {
            doCheck = false;
            doInstallCheck = false;
          });
        };
      };
    })
  ];
}
