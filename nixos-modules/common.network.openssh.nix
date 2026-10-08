{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.network.openssh.enable = lib.mkEnableOption "common.network.openssh";

	config = lib.mkIf config.modules.common.network.openssh.enable {

        services.openssh = {
            enable = true;
            openFirewall = true;
        };
        
    };
}
