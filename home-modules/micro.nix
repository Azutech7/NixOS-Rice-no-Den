{ inputs, config, lib, pkgs, ... }: {

    options.modules.micro.enable = lib.mkEnableOption "micro";

    config = lib.mkIf config.modules.micro.enable (
        let
            c = config.modules.theme.color;
        in
        {
            programs.micro = {
                enable = true;
        
                settings = {
                    autoindent = true;
                    autosave = 0;
                    autosu = false;
                    backup = true;
                    cursorline = false;
                    truecolor = "on";
                    colorscheme = "micro-theme";
                #	fakecursor = true;
                };
            };
        
            xdg.configFile."micro/colorschemes/micro-theme.micro".text =''
                # Core
                color-link default                "#${c.foreground},#${c.background}" # 05 00
                color-link cursor-line            "#${c.foreground},#${c.cursor}"
                color-link selection              "#${c.selection},#${c.br_background}"
                color-link color-column           "#${c.background},#${c.br_background}"
                
                # Syntax
                color-link comment                "#${c.comment}"
                color-link identifier             "#${c.character}"
                color-link constant               "#${c.character}"
                color-link statement              "#${c.character}"
                color-link symbol                 "#${c.character}"
                color-link preproc                "#${c.character}"
                color-link type                   "#${c.character}"
                color-link special                "#${c.character}"
                color-link underlined             "#${c.character}"
                color-link error                  "#${c.error}"
                color-link todo                   "#${c.background},#${c.character}"
                color-link ignore                 "#${c.comment}"
                
                # Statusline
                color-link statusline             "#${c.background},#${c.foreground}"
                color-link statusline.inactive    "#${c.comment},#${c.background}"
                color-link statusline.suggestions "#${c.foreground},#${c.br_background}"
                
                # Tabs
                color-link tabbar                 "#${c.comment},#${c.background}"
                color-link tabbar.active          "#${c.primary},#${c.br_background}"
                
                # Gutter
                color-link line-number            "#${c.comment},#${c.background}"
                color-link current-line-number    "#${c.foreground},#${c.br_background}"
                color-link indent-char            "#${c.comment}"
                color-link gutter-info            "#${c.comment}"
                color-link gutter-error           "#${c.error}"
                color-link gutter-warning         "#${c.warning}"
                
                # Diff
                color-link diff-added             "#${c.warning}"
                color-link diff-modified          "#${c.warning}"
                color-link diff-deleted           "#${c.error}"
                
                # UI
                color-link scrollbar              "#${c.foreground}"
                color-link divider                "#${c.br_background}"
                color-link message                "#${c.foreground}"
                color-link error-message          "#${c.error}"
                
                # Search / Matching
                color-link match-brace            "#${c.background},#${c.primary}"
                color-link hlsearch               "#${c.background},#${c.comment}"
                
                # Whitespace
                color-link tab-error              "#${c.background},#${c.error}"
                color-link trailingws             "#${c.background},#${c.error}"
            '';
        }
		
    );
}
