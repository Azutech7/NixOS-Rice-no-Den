{ inputs, config, pkgs, lib, host, ... }: {

    options.modules.hyprland.enable = lib.mkEnableOption "hyprland";

    config = lib.mkIf config.modules.hyprland.enable {

		includes = [
			den.aspects.wayland-clipboard
		];
	
		nixos = { pkgs, ... }: {
			programs.hyprland = {
				enable = true;
				xwayland.enable = true;
			};

			services.xserver.enable = true;
			services.xserver.xkb.layout = "us";
			services.displayManager.defaultSession = "hyprland";
		};

	};
}
