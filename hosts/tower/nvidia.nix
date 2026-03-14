{ config, pkgs, ... }: {
	
	# UNFREE NEEDED FOR NVIDIA DRIVERS #
	nixpkgs.config.allowUnfree = true; 
	
	# TELL XSERVER TO USE NVIDIA DRIVERS #
	services.xserver.videoDrivers = [ "nvidia" ];

	# ACTUAL DRIVERS AND SETTINGS #
	hardware = {
		nvidia = {
			nvidiaSettings = false; 	#disable gui app#
			modesetting.enable = true; 
			
			open = true; #Needed for new drivers#

			package = config.boot.kernelPackages.nvidiaPackages.latest;
		};
	};
	
}
