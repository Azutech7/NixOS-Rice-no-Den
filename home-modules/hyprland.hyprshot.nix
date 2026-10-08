{ inputs, config, lib, pkgs, ... }: {

    options.modules.hyprland.hyprshot.enable = lib.mkEnableOption "hyprland.hyprshot";

	config = lib.mkIf config.modules.hyprland.hyprshot.enable {

        programs.hyprshot = {
            enable = true;

            saveLocation = "${config.home.homeDirectory}/Pictures/Screenshots";
        };
		
	};
}
