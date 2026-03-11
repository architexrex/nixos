{ config, pkgs, ... }: {

	hardware.graphics.enable = true;
	hardware.graphics.enable32Bit = true;
	
	services = {
		xserver = {
			enable = true;
			
			windowManager.i3.enable = true; 
			
			resolutions = [ { x = 1920; y = 1080; } ];

			displayManager.lightdm = {
				enable = true;
				#background =    
				#can also switch to gtk greeter#
			};
			
			xkb.layout = "us";
			xkb.variant = "";
		};
		picom = {
			enable = true;
			backend = "glx";
			vSync = true;
			
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
