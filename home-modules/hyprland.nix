{ inputs, config, pkgs, ... }: {

	options.modules.hyprland.enable = lib.mkEnableOption "hyprland";

	config = lib.mkIf config.modules.hyprland.enable (
		let
			terminal = "${pkgs.kitty}/bin/kitty";
			menu = "${pkgs.fuzzel}/bin/fuzzel";
			c = config.modules.theme.color;
		in
		{
			#wayland.windowManager.hyprland.systemd.enable = true;
			wayland.windowManager.hyprland = {
			enable = true;
			xwayland.enable = true;

			configType = "hyprlang";
		
			package = null;
			portalPackage = null;
		
			settings = {
		
				"$mainMod" = "SUPER";
				"$terminal" = terminal;
				"$menu" = menu;
		
				"$colPrimary" = "0xff${c.primary}";
				"$colSecondary" = "0xff${c.primary}";
				"$colTertiary" = "0xff${c.primary}";
				"$colBackground" = "0xff${c.background}";
				"$colForeground" = "0xff${c.foreground}";
		
				general = {
				gaps_in = 5;
				gaps_out = 10;
				border_size = 2;
		
				"col.active_border" = "$colPrimary";
				"col.inactive_border" = "$colSecondary";
		
				resize_on_border = false;
				allow_tearing = false;
				layout = "dwindle";
				};
		
				decoration = {
				active_opacity = 1.0; #0.8
				inactive_opacity = 1.0; #0.8
				fullscreen_opacity = 1.0;
			
			rounding = 10;
			rounding_power = 2;
		
				shadow = {
					enabled = false;
					range = 4;
					render_power = 3;
					color = "$colBackground";
				};
		
				blur = {
					enabled = true;
					size = 5;
					passes = 2;
					vibrancy = 0.1696;
					noise = 0.0117;
					new_optimizations = true;
					ignore_opacity = true;
				};
				};
		
				animations = {
				enabled = true;
		
				bezier = [
					"easeOutQuint,   0.23, 1,    0.32, 1"
					"easeInOutCubic, 0.65, 0.05, 0.36, 1"
					"linear,         0,    0,    1,    1"
					"almostLinear,   0.5,  0.5,  0.75, 1"
					"quick,          0.15, 0,    0.1,  1"
				];
		
				animation = [
					"global,        1,     10,    default"
					"border,        1,     5.39,  easeOutQuint"
					"windows,       1,     4.79,  easeOutQuint"
					"windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
					"windowsOut,    1,     1.49,  linear,       popin 87%"
					"fadeIn,        1,     1.73,  almostLinear"
					"fadeOut,       1,     1.46,  almostLinear"
					"fade,          1,     3.03,  quick"
					"layers,        1,     3.81,  easeOutQuint"
					"layersIn,      1,     4,     easeOutQuint, fade"
					"layersOut,     1,     1.5,   linear,       fade"
					"fadeLayersIn,  1,     1.79,  almostLinear"
					"fadeLayersOut, 1,     1.39,  almostLinear"
					"workspaces,    1,     1.94,  almostLinear, fade"
					"workspacesIn,  1,     1.21,  almostLinear, fade"
					"workspacesOut, 1,     1.94,  almostLinear, fade"
					"zoomFactor,    1,     7,     quick"
				];
				};
		
				dwindle = {
				#pseudotile = true; #sad to see it go
				preserve_split = true;
				};
		
				master = {
				new_status = "master";
				};
		
				misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
				};
		
				input = {
				kb_layout = "us";
				follow_mouse = 1;
				mouse_refocus = false;
				sensitivity = 0;
				force_no_accel = 1;
		
				touchpad = {
					natural_scroll = false;
				};
				};
		
				cursor = {
				no_hardware_cursors = true;
				enable_hyprcursor = false;
				};
		
				gesture = "3, horizontal, workspace";
		
				device = [
				{
					name = "epic-mouse-v1";
					sensitivity = -0.5;
				}
				];
		
				monitor = [
				"DP-2, 1920x1080@144, 1920x0, 1"
				"DP-3, 1920x1080@144, 0x0, 1"
				"eDP-1, 1920x1080@60, 0x0, 1.25"
				];
		
				bind = [
				"$mainMod, C, exec, $terminal"
				"$mainMod, Q, killactive"
				"$mainMod, M, exit"
				"$mainMod, V, togglefloating"
				"$mainMod, R, exec, $menu"
				"$mainMod, F, fullscreen"
		
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"
		
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
		
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
		
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"
		
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
		
				"CONTROL SHIFT, C, exec, wl-paste --primary | wl-copy"
				"CONTROL SHIFT, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
		
				"$mainMod, P, exec, hyprshot -m region"
				];
		
				bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
				];
		
				bindel = [
				"$mainMod, F3, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				"$mainMod, F2, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				"$mainMod, F1, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				"$mainMod, F4, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				"$mainMod, F6, exec, brightnessctl -e4 -n2 set +5%"
				"$mainMod, F5, exec, brightnessctl -e4 -n2 set 5%-"
				];
		
				bindl = [
				"$mainMod, F8, exec, playerctl next"
				"$mainMod, F10, exec, playerctl play-pause"
				"$mainMod, F9, exec, playerctl play-pause"
				"$mainMod, F7, exec, playerctl previous"
				];
		
				exec-once = [
				"hyprpaper"
				"hypridle"
				"waybar"
				"cliphist wipe"
				"wl-paste --type text --watch cliphist store"
				"wl-paste --type image --watch cliphist store"
				];
		
				xwayland.force_zero_scaling = true;
			};
			};
		};
		
	);
}
