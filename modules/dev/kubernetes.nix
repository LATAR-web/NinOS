{ pkgs, lib, config, ... }:
lib.mkIf config.myProfiles.kubernetes {
  # ======================================================
  # Kubernetes — herramientas de desarrollo local
  # ======================================================
  environment.systemPackages = with pkgs; [
    kubectl
    kubernetes-helm
    kind
    minikube
    k9s
    kubectx
    kompose
    stern
  ];
}
