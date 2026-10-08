{ inputs, config, lib, pkgs, ... }: {

    options.modules.vesktop.enable = lib.mkEnableOption "vesktop";

    config = lib.mkIf config.modules.vesktop.enable {

        programs.vesktop = {
            enable = true;

            vencord.settings = {
                autoUpdate = true;
                autoUpdateNotification = true;
                notifyAboutUpdates = true;

                plugins = {
                    ClearURLs.enabled = true;
                    FixYoutubeEmbeds.enabled = true;
                };
            };
        };
        
    };
}
