{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.services.caddy.enable = lib.mkEnableOption "services.caddy";

    config = lib.mkIf config.modules.services.caddy.enable {

        services.caddy = {
            enable = true;

            virtualHosts = {
                "aiostreams.azutech.cc".extraConfig = ''
                    rewrite * /stremio{uri}
                    reverse_proxy localhost:3000
                '';

                "jellyfin.azutech.cc".extraConfig = ''
                    rewrite * /jellyfin{uri}
                    reverse_proxy localhost:3000
                '';

                "adguard.azutech.cc".extraConfig = ''
                    reverse_proxy 127.0.0.1:8080
                '';
            };
        };


    };
}
