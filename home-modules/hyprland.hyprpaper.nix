{ inputs, config, lib, pkgs, ... }: {

    options.modules.hyprland.hyprpaper.enable = lib.mkEnableOption "hyprland.hyprpaper";

    config = lib.mkIf config.modules.hyprland.hyprpaper.enable {
    
        services.hyprpaper = {
            enable = true;
            settings = {
            ipc = "on";
                splash = false;
                preload = [
                    "${config.modules.theme.image.wallpaper}"
                ];
                wallpaper = [
                    {
                        monitor = "";
                        path = "${config.modules.theme.image.wallpaper}";
                    }
                ];
            };
        };
		
	};
}
