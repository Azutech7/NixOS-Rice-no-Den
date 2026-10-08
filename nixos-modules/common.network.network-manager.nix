{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.network.network-manager.enable = lib.mkEnableOption "common.network.network-manager";

	config = lib.mkIf config.modules.common.network.network-manager.enable {

		networking = {
			networkmanager = {
				enable = true;
				wifi.macAddress = "random";
				wifi.scanRandMacAddress = true;

				dns = lib.mkDefault "default";
			};

			enableIPv6 = false;
			#preferIPv4 = true; #not a valid option

			nameservers = lib.mkDefault [ "1.1.1.1" "8.8.8.8" ];
		};

	};
}
