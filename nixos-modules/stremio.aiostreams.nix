{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.stremio.aiostreams.enable = lib.mkEnableOption "stremio.aiostreams";

    config = lib.mkIf config.modules.stremio.aiostreams.enable {

        virtualisation.oci-containers.backend = "docker";

        virtualisation.oci-containers.containers.aiostreams = {
            image = "ghcr.io/viren070/aiostreams:latest";

            autoStart = true;
            ports = [ "3000:3000" ];

            volumes = [ "/var/lib/aiostreams:/app/data" ];

            environmentFiles = [ "/var/lib/aiostreams/secret.env" ];
        };

        networking.firewall.allowedTCPPorts = [ 3000 ];

    };
}