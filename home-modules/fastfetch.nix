{ inputs, config, ... }: {

	options.modules.fastfetch.enable = lib.mkEnableOption "fastfetch";

	config = lib.mkIf config.modules.fastfetch.enable (
        let
            c = config.modules.theme.color;
            img = config.modules.theme.image.fetch-icon;
        in
        {
            programs.fastfetch = {
                enable = true;
        
                settings = {
                
                    logo = {
                        source = img;
                        type = "kitty";
                        #width = 24;
                        height = 18;
                        padding = {
                            top = 1;
                            right = 2;
                            bottom = 0;
                            left = 2;
                        };
                    };
        
                    display = {
                        separator = " ";
                        color = {
                            keys = "#${c.foreground}";
                            title = "#${c.primary}";
                        };
                        key = {
                            width = 6;
                            type = "icon";
                        };
                        bar = {
                            width = 16;
                            char = {
                                elapsed = "#";
                                total = "-";	
                            };	
                        };
                        percent = {
                            type = 3;
                            color = {
                                green = "#${c.green}";
                                yellow = "#${c.yellow}";
                                red = "#${c.red}";
                            };
                        };
                    };
        
                    modules = [
        
        #### NEW MODULES #####
        #╭ ╮ ╰ ╯ ─ │
        #### END PARTITION ####
        
        
        
                    
                        "break"
                        "title"
                        "separator"
                        
                        "os"
                        "kernel"
                        "shell"
                        "initsystem"
                        "separator"
        
                        "cpu"
                        "gpu"
                        "memory"
                        "disk"
                        "battery"
                        "separator"
        
                        "de"
                        "wm"
                        "font"
                        "cursor"
                        "terminal"
                    ];
                };
            };
        };
			
	);
}
