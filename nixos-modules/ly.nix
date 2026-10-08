{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.ly.enable = lib.mkEnableOption "ly";

    config = lib.mkIf config.modules.ly.enable {

        services.displayManager.ly.enable = true;

    };
}
