{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.services.tailscale.enable = lib.mkEnableOption "services.tailscale";

    config = lib.mkIf config.modules.services.tailscale.enable {

        services.tailscale.enable = true;
        networking.firewall.trustedInterfaces = [ "tailscale0" ];

    };
}
