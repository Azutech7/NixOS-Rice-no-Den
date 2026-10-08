{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.security.gnupg.enable = lib.mkEnableOption "common.security.gnupg";

	config = lib.mkIf config.modules.common.security.gnupg.enable {

        programs.gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };

    };
}
