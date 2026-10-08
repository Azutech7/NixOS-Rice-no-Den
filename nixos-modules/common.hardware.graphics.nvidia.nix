{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.hardware.graphics.nvidia.enable = lib.mkEnableOption "common.hardware.graphics.nvidia";

	config = lib.mkIf config.modules.common.hardware.graphics.nvidia.enable {

		hardware.nvidia = {
			open = true;
			modesetting.enable = true;
			nvidiaSettings = true;
		};

		services.xserver.videoDrivers = [
			"nvidia"
		];
			
	};
}
