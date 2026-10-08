{ inputs, pkgs, lib, host, config, ... }: {

    options.modules.common.network.captive-browser.enable = lib.mkEnableOption "common.network.captive-browser";

	config = lib.mkIf config.modules.captive-browser.enable {
            
        environment.systemPackages = with pkgs; [
            captive-browser
        ];
		
	};
}
