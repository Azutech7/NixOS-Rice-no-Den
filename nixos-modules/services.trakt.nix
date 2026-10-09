{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.services.trakt.enable = lib.mkEnableOption "services.trakt";

    config = lib.mkIf config.modules.services.trakt.enable {

        virtualisation.oci-containers.backend = "docker";

        virtualisation.oci-containers.containers.trakt = {
            image = "ghcr.io/ericvlog/trakt-sync-rating-addon:latest";

            autoStart = true;
            ports = [ "7000:7000" ];
            
            extraOptions = [
                #"--network=host"
                "--memory=2g"
                "--memory-swappiness=0"
                "--cpus=2"
                "--restart=on-failure:5"
                "--ulimit=nofile=2048:4096"
                "--log-driver=journald"
            ];

        };

        #networking.firewall.allowedTCPPorts = [ 3000 ];

    };
}
