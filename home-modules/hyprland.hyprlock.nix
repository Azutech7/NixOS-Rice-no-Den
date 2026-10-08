{ inputs, config, ... }: {

    options.modules.hyprland.hyprlock.enable = lib.mkEnableOption "hyprland.hyprlock";

    config = lib.mkIf config.modules.hyprland.hyprlock.enable (
        let
            c = config.modules.theme.color;
            img = config.modules.theme.image.wallpaper;
            fnt = config.modules.theme.font.name;
        in
        {
            programs.hyprlock = {
                enable = true;
        
                settings = {
                
                    "$colPrimary" = "0xff${c.primary}";
                    "$colSecondary" = "0xff${c.primary}";
                    "$colTertiary" = "0xff${c.primary}";
                    "$colBackground" = "0xff${c.background}";
                    "$colForeground" = "0xff${c.foreground}";
        
                    general = {
                        hide_cursor = true;
                        ignore_empty_input = true;
                    };
        
                    animations = {
                        enabled = true;
                        fade_in = {
                            duration = 300;
                            bezier = "easeOutQuint";
                        };
                        fade_out = {
                            duration = 300;
                            bezier = "easeOutQuint";
                        };
                    };
        
                    background = [
                        {
                            monitor = "";
                            path = "${img}";
                            blur_passes = 3;
                            blur_size = 5;
                        }
                    ];
        
                    input-field = [
                        {
                            monitor = "";
                            size = "20%, 5%";
                            position = "0, 120";
                            halign = "center";
                            valign = "bottom";
                            outline_thickness = 2;
                            
                            inner_color = "$colBackground";
                            outer_color = "$colPrimary";
                            check_color = "0xff${c.yellow}";
                            fail_color = "0xff${c.red}";
                            font_color = "$colPrimary";
        
                            fade_on_empty = false;
                            rounding = 10;
        
                            font_familty = "${fnt}";
                            placeholder_text = "Enter Password";
                            fail_text = "$PAMFAIL";
        
                            dots_size = 0.35;
                            dots_spacing = 0.25;
                            dots_center = true;
                        }	
                    ];
        
                    label = [
                        {
                            monitor = "";
        
                            text = "$TIME";
                            font_size = 80;
                            font_family = "${fnt}";
                            color = "$colPrimary";
        
                            position = "-30, 0";
                            halign = "right";
                            valign = "top";
                        }
                        {
                            monitor = "";
        
                            text = "cmd[update:1000] echo -e \"$(date + '%A, %d %B %Y')\"";
                            font_size = 24;
                            font_family = "${fnt}";
                            color = "$colPrimary";
        
                            position = "-30, -150";
                            halign = "right";
                            valign = "top";
                        }
                    ];
                };
            };
        }
			
	);
}
