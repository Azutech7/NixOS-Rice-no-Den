{ inputs, pkgs, lib, host, config, ... }: {

    options.modules.common.input.touchpad.enable = lib.mkEnableOption "common.input.touchpad";

    config = lib.mkIf config.modules.common.input.touchpad.enable {
        
        services.libinput.enable = true;

    };
}
