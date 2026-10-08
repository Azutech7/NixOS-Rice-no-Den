{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.security.network.firewall.enable = lib.mkEnableOption "common.security.network.firewall";

	config = lib.mkIf config.modules.common.security.network.firewall.enable {
	
		networking.firewall = {
			enable = lib.mkForce true;
			
			allowedUDPPorts = lib.mkDefault [];
			allowedTCPPorts = lib.mkDefault [];

			checkReversePath = "strict";
			allowPing = false; 
		};

	};
}
