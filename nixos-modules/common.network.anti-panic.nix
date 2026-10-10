{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.network.anti-panic.enable = lib.mkEnableOption "common.network.anti-panic";

	config = lib.mkIf config.modules.common.network.anti-panic.enable {

		boot.kernel.sysctl = {
			# Increase the maximum number of packets allowed to queue
			"net.core.netdev_max_backlog" = 100000;

			# Increase maximum socket receive/send buffer sizes for high traffic
			"net.core.rmem_max" = 16777216;
			"net.core.wmem_max" = 16777216;

			# Automatically reboot 10 seconds after a kernel panic occurs
			"kernel.panic" = 10;

			# Enable the NMI watchdog to detect and recover from hard CPU lockups
			"kernel.watchdog_thresh" = 10;
		};

	};
}
