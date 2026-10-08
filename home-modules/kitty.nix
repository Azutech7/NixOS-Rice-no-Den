{ inputs, config, lib, ... }: {

    options.modules.kitty.enable = lib.mkEnableOption "kitty";

	config = lib.mkIf options.modules.kitty.enable (
        let
            bg = config.modules.theme.color.background;
            fg = config.modules.theme.color.foreground;
            s = config.modules.theme.color.selection;
            c = config.modules.theme.color;
        in
        {
            programs.kitty = lib.mkForce {
            enable = true;
            settings = {
                confirm_os_window_close = 0;
                dynamic_background_opacity = true;
                enable_audio_bell = false;
                mouse_hide_wait = "-1.0";
                window_padding_width = 10;
                background_opacity = "1.0";
                background_blur = 0;
                #shell_integration = "no-cursor no-title";
                #text_composition_strategy = "1.0 0";
        
                cursor_shape = "beam";
        
                foreground = "#${fg}";
                background = "#${bg}";
                selection_background = "#${s}";
                selection_foreground = "#${fg}";      
                #cursor = "#${config.lib.stylix.colors.base01}";
                #cursor_text = "#${config.lib.stylix.colors.base0E}";
                
                color0 = "#${c.red}";
                color1 = "#${c.orange}";
                color2 = "#${c.yellow}";
                color3 = "#${c.green}";
                color4 = "#${c.cyan}";
                color5 = "#${c.blue}";
                color6 = "#${c.magenta}";
                color7 = "#${c.violet}";
        
                color8 = "#${c.br_red}";
                color9 = "#${c.br_orange}";
                color10 = "#${c.br_yellow}";
                color11 = "#${c.br_green}";
                color12 = "#${c.br_cyan}";
                color13 = "#${c.br_blue}";
                color14 = "#${c.br_magenta}";
                color15 = "#${c.br_violet}";
        
                highlight_tab_color = "none";
        
                font = config.modules.theme.font.name;
                size_size = config.modules.theme.font.size.terminal;
        
                #cursor_contrast = 0.0;
        
                #term = "xterm-kitty";
                clipboard_control = "write-clipboard write-primary read-clipboard read-primary";
            };
            keybindings = {
                "ctrl+v" = "paste_from_clipboard";
            };
            };
        };
		
    );
}
