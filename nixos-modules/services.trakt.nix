{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.services.trakt.enable = lib.mkEnableOption "services.trakt";

    config = lib.mkIf config.modules.services.trakt.enable {

        virtualisation.oci-containers.backend = "docker";

        virtualisation.oci-containers.containers.trakt = {
            image = "local/trakt-sync-rating-addon:latest";
            # Build locally from: https://github.com/ericvlog/trakt-sync-rating-addon
            # git clone https://github.com/ericvlog/trakt-sync-rating-addon
            # cd trakt-sync-rating-addon
            # sed -i '/apk add/s/ /\n/2g' Dockerfile
            # sudo docker build . -t local/trakt-sync-rating-addon:latest

            autoStart = true;
            ports = [ "7000:7000" ];
            
            extraOptions = [
                "--memory=2g"
                "--memory-swappiness=0"
                "--cpus=2"
                "--ulimit=nofile=2048:4096"
                "--log-driver=journald"
            ];

        };

        #networking.firewall.allowedTCPPorts = [ 7000 ]; #tailscale instead

    };
}
