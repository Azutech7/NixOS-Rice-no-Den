{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.network.bluetooth.enable = lib.mkEnableOption "common.network.bluetooth";

	config = lib.mkIf config.modules.common.network.bluetooth.enable {
		
		hardware.bluetooth.enable = true;
		
	};
}
