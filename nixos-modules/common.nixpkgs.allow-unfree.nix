{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.nixpkgs.allow-unfree.enable = lib.mkEnableOption "common.nixpkgs.allow-unfree";

	config = lib.mkIf config.modules.common.nixpkgs.allow-unfree.enable {

        nixpkgs.config.allowUnfree = true;

    };
}
