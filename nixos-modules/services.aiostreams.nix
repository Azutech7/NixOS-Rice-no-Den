{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.services.aiostreams.enable = lib.mkEnableOption "services.aiostreams";

    config = lib.mkIf config.modules.services.aiostreams.enable {

        virtualisation.oci-containers.backend = "docker";

        virtualisation.oci-containers.containers.aiostreams = {
            image = "ghcr.io/viren070/aiostreams:latest";

            autoStart = true;
            ports = [ "3000:3000" ];

            volumes = [ "/var/lib/aiostreams:/app/data" ];

            environmentFiles = [ "/var/lib/aiostreams/secret.env" ];

            extraOptions = [
                "--memory=4g"
                "--memory-swappiness=0"
                "--cpus=2"
                "--ulimit=nofile=2048:4096"
                "--log-driver=journald" 
            ];

        };

        networking.firewall.allowedTCPPorts = [ 3000 ];

    };
}