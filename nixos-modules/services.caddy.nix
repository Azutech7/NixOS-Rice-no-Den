{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.services.caddy.enable = lib.mkEnableOption "services.caddy";

    config = lib.mkIf config.modules.services.caddy.enable {

        services.caddy = {
            enable = true;

            virtualHosts = {

                "aiostreams.azutech.cc".extraConfig = ''
                    tls internal
                    reverse_proxy http://localhost:3000
                '';

                "jellyfin.azutech.cc".extraConfig = ''
                    tls internal
                    handle / { redir * /jellyfin 302 }
                    handle { reverse_proxy localhost:3000 {
                        header_up X-Forwarded-Prefix /jellyfin
                    }}
                '';

                "adguard.azutech.cc".extraConfig = ''
                    tls internal
                    reverse_proxy localhost:8080
                '';

            };
        };


    };
}


