{ inputs, pkgs, lib, host, config, ... }: {

    options.modules.common.audio.pipewire.enable = lib.mkEnableOption "common.audio.pipewire";

    config = lib.mkIf config.modules.common.audio.pipewire.enable {

        services.pipewire = {
            enable = true;
            pulse.enable = true;
        };

        environment.systemPackages = with pkgs; [
            wiremix
        ];

    };
}
