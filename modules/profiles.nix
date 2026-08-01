{ lib, ... }:
{
  options.myProfiles = {
    gaming = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Steam, Proton, Gamescope y herramientas de gaming.";
    };
    kubernetes = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "kubectl, helm, kind, minikube y demás herramientas de k8s.";
    };
    whisperDictation = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Dictado por voz con whisper-cpp.";
    };
  };
}
