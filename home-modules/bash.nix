{ inputs, config, lib, pkgs, ... }: {

    options.modules.bash.enable = lib.mkEnableOption "bash";

    config = lib.mkIf config.modules.bash.enable (
        let
            color = config.modules.theme.color.primary;
        
            hexToDecStr = hex: toString (builtins.fromJSON (builtins.readFile (pkgs.runCommand "hex" {} "echo 0x${hex} > $out")));
            toDec = hex: toString (lib.attrsets.getAttrFromPath ["v"] (builtins.fromTOML "v = 0x${hex}"));
        
            # c = builtins.substring start length string;
            colorRed = toDec (builtins.substring 0 2 color);
            colorGreen = toDec (builtins.substring 2 2 color);
            colorBlue = toDec (builtins.substring 4 2 color);
        
            promptColor = "\\[\\e[38;2;${colorRed};${colorGreen};${colorBlue}m\\]";
            reset = "\\[\\e[0m\\]";
        in
        {
            programs.bash = {
                enable = true;
        
                enableCompletion = true;
        
                sessionVariables = {
                    MICRO_TRUECOLOR = 1;
                };
        
                initExtra = ''
                    PS1='\n${promptColor}╭───(\t)─(\u@\h)─(\w)\n${promptColor}╰─\$ ${reset}'
                    clear && fastfetch
                '';
            };
        }
		
	);
}
