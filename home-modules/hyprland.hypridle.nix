{ inputs, config, lib, pkgs, ... }: {

    options.modules.hyprland.hypridle.enable = lib.mkEnableOption "hyprland.hypridle";

	config = lib.mkIf config.modules.hyprland.hypridle.enable {

		services.hypridle = {
			enable = true;

			settings = {

				general = {
					lock_cmd = "pidof hyprlock || hyprlock";
					before_sleep_cmd = "loginctl lock-session";
					after_sleep_cmd  = "hyprctl dispatch dpms on";	
				};

				listener = [
					{
						timeout = 1800;
						on-timeout = "brightnessctl -s set 10%; loginctl lock-session";
						on-resume = "brightnessctl -r";
					}
				];
					
			};	
		};
		
	};
}
