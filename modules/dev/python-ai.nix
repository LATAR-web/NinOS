{ pkgs, ... }:
{
  # ======================================================
  # Python para Ingeniería de IA
  # ======================================================
  #
  # Filosofía: aquí solo va lo "base" que quieres disponible
  # SIEMPRE, en cualquier terminal, sin activar nada.
  #
  # Librerías pesadas y que cambian mucho de versión según el
  # proyecto (torch, transformers, accelerate, etc.) NO van aquí.
  # Esas se instalan por proyecto con `uv`, así:
  #
  #   cd mi-proyecto/
  #   uv venv
  #   source .venv/bin/activate
  #   uv pip install torch transformers accelerate
  #
  # Ventaja: cada proyecto tiene sus propias versiones (CPU/CUDA,
  # versión exacta de torch, etc.) sin pelearse entre sí ni con
  # nixpkgs, y el sistema no se infla con cada rebuild.

  environment.systemPackages = with pkgs; [
    # ---- Python base ----
    python312
    python312Packages.pip
    python312Packages.virtualenv
    python312Packages.ipython

    # ---- Gestores de proyectos/entornos ----
    uv          # gestor rapidísimo de venvs/paquetes (recomendado)
    poetry      # gestor clásico, por si algún proyecto ya lo usa

    # ---- Jupyter (liviano, útil tenerlo siempre a la mano) ----
    jupyter

    # ---- Librerías científicas ligeras (sí valen la pena a nivel sistema) ----
    python312Packages.numpy
    python312Packages.pandas
    python312Packages.matplotlib
    python312Packages.scikit-learn
    python312Packages.scipy
    python312Packages.requests

    # ---- Calidad de código ----
    ruff                    # linter/formatter (reemplaza flake8+black+isort)
    python312Packages.mypy
  ];
}
