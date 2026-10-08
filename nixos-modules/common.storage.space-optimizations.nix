{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.storage.space-optimizations.enable = lib.mkEnableOption "common.storage.space-optimizations";

	config = lib.mkIf config.modules.common.storage.space-optimizations.enable {

        nix = {

            gc = {
                automatic = lib.mkDefault true;
                dates = lib.mkDefault "03:25";
                options = lib.mkDefault "--delete-older-than 7d";
                persistent = lib.mkDefault true; 
            };

            settings.auto-optimise-store = true;

        };

    };
}
