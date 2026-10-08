{ inputs, config, ... }: {

	options.modules.cava.enable = lib.mkEnableOption "cava";

	config = lib.mkIf config.modules.cava.enable (
        let
            bg = config.modules.theme.color.background;
            fg = config.modules.theme.color.foreground;
        in
        {
            programs.cava = {
                enable = true;
        
                settings = {
                    general.framerate = 60;
                    input.method = "alsa";
                    smoothing.noise_reduction = 88;
                    color = {
                        background = "'#${bg}’";
                        foreground = "'#${fg}'";
                    };
                };
            };
        }
		
	);
}
