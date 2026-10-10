{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.services.caddy.enable = lib.mkEnableOption "services.caddy";

    config = lib.mkIf config.modules.services.caddy.enable {

        services.caddy = {
            enable = true;

            virtualHosts = {
                "aiostreams.azutech.cc".extraConfig = ''
                    tls internal
                    rewrite * /stremio{uri}
                    reverse_proxy localhost:3000
                '';

                "jellyfin.azutech.cc".extraConfig = ''
                    tls internal
                    rewrite * /jellyfin{uri}
                    reverse_proxy localhost:3000
                '';

                "adguard.azutech.cc".extraConfig = ''
                    tls internal
                    reverse_proxy 127.0.0.1:8080
                '';
            };
        };


    };
}
