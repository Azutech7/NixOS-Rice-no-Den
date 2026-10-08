{ inputs, config, lib, pkgs, ... }: {

    options.modules.fuzzel.enable = lib.mkEnableOption "fuzzel";

	config = lib.mkIf config.modules.fuzzel.enable (
        let
            bg = config.modules.theme.color.background;
            fg = config.modules.theme.color.foreground;
            s = config.modules.theme.color.selection;
            c = config.modules.theme.color.primary;
            fnt = config.modules.theme.font.name;
            sz = config.modules.theme.font.size.popups;
        in
        {
            programs.fuzzel = {
                enable = true;
                settings = {
                    main = {
                        terminal = "${pkgs.kitty}/bin/kitty";
                        layer = "overlay";
                        font = "${fnt}:size=${toString sz}";
                        anchor = "center";
                        icons-enabled = "no";
                    };
                    colors = {
                        background = "${bg}ff";
                        text = "${fg}ff";
                        prompt = "${fg}ff";
                        input = "${fg}ff";
                        match = "${c}ff";
                        selection = "${s}ff";
                        selection-text = "${fg}ff";
                        selection-match = "${c}ff";
                        border = "${c}ff";
                    };
                    border = {
                        width = 2;
                        radius = 10;
                    };
                };
            };
        }
		
	);
}
