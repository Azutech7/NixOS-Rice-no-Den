{ inputs, config, lib, pkgs, ... }: {

    options.modules.spotify-player.enable = lib.mkEnableOption "spotify-player";

    config = lib.mkIf config.modules.spotify-player.enable {
            
        programs.spotify-player = {
            enable = true;

            settings = {
                theme = "default";
                playback_window_position = "Bottom";
                client_port = 8080;
                layout = "desktop";
                playback_format = "{track} • {artist}";


                copy_command = {
                    command = "wl-copy";
                    args = [];
                };

                device = {
                    name = "Nix TUI Client";
                    device_type = "computer";
                    volume = 70;
                    bitrate = 320;
                    audio_cache = true;
                    normalization = true;
                };
            };

            themes = [
                {
                    name = "default";
                    palette = {
                        background = "#${config.modules.theme.color.background}";
                        foreground = "#${config.modules.theme.color.foreground}";
                        primary = "#${config.modules.theme.color.foreground}";
                        secondary = "#${config.modules.theme.color.foreground}";
                        alert = "#${config.modules.theme.color.foreground}";

                        black           = "#000000";
                        red             = "#${config.modules.theme.color.red}";
                        green           = "#${config.modules.theme.color.green}";
                        yellow          = "#${config.modules.theme.color.yellow}";
                        blue            = "#${config.modules.theme.color.blue}";
                        magenta         = "#${config.modules.theme.color.magenta}";
                        cyan            = "#${config.modules.theme.color.cyan}";
                        white           = "#ffffff";
                    };
                    component_style = {
                        block_title = { fg = "magenta"; modifiers = ["Bold"]; };
                        playing_track = { fg = "green"; modifiers = ["Underlined"]; };
                    };
                }
            ];

        };
        
    };
}
