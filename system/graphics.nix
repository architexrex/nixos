{ config, pkgs, ... }: {

	hardware.graphics.enable = true;
	hardware.graphics.enable32Bit = true; #For 32Bit Games
	
	services = {
		xserver = {
			enable = true;
			
			windowManager.i3.enable = true; 
			
			resolutions = [ { x = 1920; y = 1080; } ];

			displayManager.lightdm = {
				enable = true;
				background = /etc/nixos/media/cottage.jpg;   
				#can also switch to gtk greeter#
			};
			
			xkb.layout = "us";
			xkb.variant = "";
		};
		picom = {
			enable = true;
			backend = "glx";
			vSync = true;
			
			activeOpacity = 0.96;
			inactiveOpacity = 0.94;
			menuOpacity = 1;
			opacityRules = [
				"100:class_g = 'librewolf'"
				"85:class_g = 'kitty'"
			];

		};
	};
	
	
	#NVIDIA#
	hardware = {
		nvidia = {
			nvidiaSettings = false; 	#disable gui app#
			modesetting.enable = true; 
			
			open = true; #Needed for new drivers#

			package = config.boot.kernelPackages.nvidiaPackages.latest;
		};
	};
	services.xserver.videoDrivers = [ "nvidia" ];
}
