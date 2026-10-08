{ inputs, config, pkgs, ... }: {
	
    options.modules.mako.enable = lib.mkEnableOption "mako";

	config = lib.mkIf config.modules.mako.enable (
        let
            bg = config.modules.theme.color.background;
            fg = config.modules.theme.color.foreground;
            c = config.modules.theme.color.primary;
            fnt = config.modules.theme.font.name;
            sz = config.modules.theme.font.size.popups;
            red = config.modules.theme.color.red;
        in
        {
            services.mako = {
                enable = true;
            
                settings = {
                    background-color = "#${bg}ff";
                    border-color = "#${c}ff";
                    border-radius = 5;
                    border-size = 2;
                    default-timeout = 4000;
                    font = "${fnt} ${builtins.toString sz}";
                    text-color = "#${fg}ff";
                    "urgency=high" = {
                        border-size = 2;
                        border-color = "#${red}ff";
                    };
                };
            };
        };
        
    );
}


