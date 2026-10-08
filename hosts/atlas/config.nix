{ inputs, pkgs, lib, host, config, ... }: {
    
    imports = [
        ./fileSystems.nix
    ];

    options.modules = {
        common = {
            boot.enable = true;
            hardware.automatic-compatability.enable = true;
            hardware.graphics.intel-mesa.enable = true;
            home-manager.backup.enable = true;
            network.avahi.enable = true;
            network.network-manager.enable = true;
            network.openssh.enable = true;
            security.gnupg.enable = true;
            security.network.firewall.enable = true;
            security.pam.enable = true;
            storage.nixpkgs.enable = true;
            storage.space-optimization.enable = true;
        };

        stremio.aiostreams.enable = true;
    };

    environment.systemPackages = with pkgs; [
        micro
        wget
        git
        yazi
        btop
        unzip
        p7zip
        fzf
        libgcc
        tree
        parted
    ];
}