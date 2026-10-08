{ inputs, config, lib, pkgs, ... }: {

    options.modules.vscodium.enable = lib.mkEnableOption "vscodium";

    config = lib.mkIf config.modules.vscodium.enable {

        programs.vscode = {
            enable = true;
            package = pkgs.vscodium;

            profiles.default.extensions = with pkgs.vscode-extensions; [
                jnoortheen.nix-ide
            ];
        };

    };
}
