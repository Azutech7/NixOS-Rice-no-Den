{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.extra-experimental-features.enable = lib.mkEnableOption "common.extra-experimental-features";

	config = lib.mkIf config.modules.common.extra-experimental-features.enable {

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

    };
}
