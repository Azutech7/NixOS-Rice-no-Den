{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.network.printing.enable = lib.mkEnableOption "common.network.printing";

	config = lib.mkIf config.modules.common.network.printing.enable {

        services.printing = {
            enable = true;
            drivers = with pkgs; [
                gutenprint
                hplip
            ];
        };

    };
}
