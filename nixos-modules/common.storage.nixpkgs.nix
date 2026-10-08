{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.storage.nixpkgs.enable = lib.mkEnableOption "common.storage.nixpkgs";

	config = lib.mkIf config.modules.common.storage.nixpkgs.enable {

            nixpkgs.config.allowUnfree = true;

    };
}
