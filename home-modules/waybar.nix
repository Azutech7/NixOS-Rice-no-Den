{ inputs, config, lib, pkgs, ... }: {

    options.modules.waybar.enable = lib.mkEnableOption "waybar";

	config = lib.mkIf config.modules.waybar.enable {

        programs.waybar = {
        
            enable = true;

            settings.bar = {

                layer = "bottom";
                position = "top";
                mod = "dock";
                exclusive = true;
                passthrough = false;
                gtk-layer-shell = true;

                height = 35;

                margin-top = 10;
                margin-right = 10;
                margin-bottom = 0;
                margin-left = 10;

                output = [
                    "DP-2"
                    "DP-3"
                    "eDP-1"
                ];

                modules-left = [
                    "clock"
                    "wireplumber"
                ];

                modules-center = [
                    "hyprland/window"
                ];

                modules-right = [
                    "hyprland/workspaces"
                ];

                "hyprland/workspaces" = {
                    all-outputs = true;
                    format = "{name}";
                    on-scroll-up = "hyprctl dispatch workspace e+1";
                    on-scroll-down = "hyprctl dispatch workspace e-1";
                };

                "hyprland/window" = {
                    format = "{}";
                };

                clock = {
                    interval = 1;
                    tooltip = false;
                    format = "  {:%H:%M:%S    %F}";
                };

                wireplumber = {
                    format = "   {volume}% ";
                    format-muted = "  {volume}% ";
                    tooltip = false;
                    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
                    on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                };
                
            };

            style = ''

                @define-color colPrimary #${config.modules.theme.color.primary};
                @define-color colSecondary #${config.modules.theme.color.primary};
                @define-color colTertiarty #${config.modules.theme.color.primary};
                @define-color colBackground #${config.modules.theme.color.background};
                @define-color colForeground #${config.modules.theme.color.foreground};

                * {
                border: none;
                border-radius: 10px;

                font-weight: bold;
                font-size: 16px;

                min-height: 0;

                padding: 0px;

                margin: 0px;

                box-shadow: none;
                text-shadow: none;

                background: none;
                }

                window#waybar {
                background: none;
                margin: 0px 0px 0px 0px;
                padding: 10px 10px 10px 10px;
                color: @colPrimary;
                }

                tooltip {
                border: 2px solid @colPrimary;
                background: @colBackground;
                padding: 2px 2px 2px 2px;
                margin: 10px 10px 10px 10px;
                }

                #workspaces button {
                padding: 1px 1px 1px 1px;
                margin: 1px 1px 1px 1px;
                border-radius: 5px;
                color: @colPrimary;
                }

                #workspaces button.active {
                color: @colBackground;
                background: @colPrimary;
                }

                #workspaces button.urgent {
                color: @colForeground;
                background: @colBackground;
                }

                #workspaces button:hover {
                color: @colBackground;
                background: @colForeground;
                }

                #workspaces {
                border: 2px solid @colPrimary;
                background: @colBackground;
                color: @colPrimary;
                padding: 2px 2px 2px 2px;
                /*margin: 5px 5px 5px 5px;*/
                }

                #window {
                border: 2px solid @colPrimary;
                background: @colBackground;
                padding: 2px 10px 2px 10px;
                /*margin: 5px 5px 5px 5px;*/
                color: @colPrimary;
                }

                #clock {
                border: 2px solid @colPrimary;
                background: @colBackground;
                padding: 2px 10px 2px 10px;
                margin: 0px 10px 0px 0px;
                color: @colPrimary;
                }

                #wireplumber {
                border: 2px solid @colPrimary;
                background: @colBackground;
                padding: 2px 2px 2px 2px;
                /*margin: 5px 5px 5px 5px;*/
                color: @colPrimary;
                }

            '';				
            
        };
		
	};
}
