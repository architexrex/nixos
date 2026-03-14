
{ config, pkgs, ... }: {
	
	# ENSURE DEVICE FIRMWARE WORKS # 
	hardware.enableAllFirmware = true;

	# PULSEAUDIO USES THIS #
	security.rtkit.enable = true;

	# PIPEWIRE WITH ALSA > PULSE #
	services = {
		pipewire ={
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true; # FOR 32 BIT GAMES #
			
		};
		pulseaudio = {
			enable = false;
		};
	};		
}	
