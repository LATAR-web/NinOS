{ pkgs, ... }:
{
  # ======================================================
  # Kubernetes — herramientas de desarrollo local
  # ======================================================
  # kind y minikube crean clusters de Kubernetes reales pero ligeros,
  # corriendo dentro de contenedores Docker (ya tienes Docker activo
  # en modules/dev/tools.nix). Ideal para desarrollo/pruebas, no para
  # producción.

  environment.systemPackages = with pkgs; [
    kubectl          # CLI principal para hablar con cualquier cluster
    kubernetes-helm  # gestor de paquetes de Kubernetes (charts)
    kind             # cluster de K8s dentro de Docker, rápido de crear/destruir
    minikube         # alternativa a kind, con más opciones de addons/dashboard
    k9s              # UI de terminal para navegar el cluster (muy recomendado)
    kubectx          # cambiar rápido entre contexts/namespaces (kubectx/kubens)
    kompose          # convierte docker-compose.yml a manifiestos de k8s
    stern            # ver logs de múltiples pods a la vez, en tiempo real
  ];
}
