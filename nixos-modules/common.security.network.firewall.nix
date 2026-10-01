{ inputs, config, pkgs, lib, host, user, ... }: {

	options.modules.common.security.network.firewall.enable = lib.mkEnableOption "common.security.network.firewall";

	config = lib.mkIf config.modules.common.network.security.firewall.enable {
	
		networking.firewall = {
			enable = true;
			
			allowedUDPPorts = [];
			allowedTCPPorts = [];

			checkReversePath = "strict";
			allowPing = false; 
		};

	};
}
