{ inputs, pkgs, lib, host, config, ... }: {

    options.modules.common.home-manager.backup.enable = lib.mkEnableOption "common.home-manager.backup";

    config = lib.mkIf config.modules.common.home-manager.backup.enable {
        
        home-manager = {
            backupFileExtension = "bak";
            overwriteBackup = true;
        };

    };
}
