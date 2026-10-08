{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.steam.enable = lib.mkEnableOption "steam";

    config = lib.mkIf config.modules.steam.enable {

		programs.steam = {
			enable = true;

			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;

			gamescopeSession.enable = true;

			extraCompatPackages = with pkgs; [
				proton-ge-bin
			];
		};

    };
}
