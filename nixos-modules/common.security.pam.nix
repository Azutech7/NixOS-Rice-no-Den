{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.security.pam.enable = lib.mkEnableOption "common.security.pam";

	config = lib.mkIf config.modules.common.security.pam.enable {

        security.pam.loginLimits = [
            { domain = "*"; type = "soft"; item = "nofile"; value = "1048576"; }
            { domain = "*"; type = "hard"; item = "nofile"; value = "1048576"; }
        ];

    };
}
