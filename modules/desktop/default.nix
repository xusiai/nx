{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkDefault;

  cfg = config.hardware.desktop;
in {
  options = {
    hardware.desktop.enable = mkEnableOption "Enable desktop specific configuration";
  };

  config = mkIf cfg.enable {
    networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;

    services.xserver.videoDrivers = ["nvidia"];

    environment.variables = {
      GBM_BACKEND = "nvidia-drm";
      NVD_BACKEND = "direct";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      LIBVA_DRIVER_NAME = "nvidia";
    };

    hardware = {
      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.beta;
        open = false;
        modesetting.enable = true;
      };

      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
        ];
      };
    };
  };
}
