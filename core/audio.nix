
{ config, pkgs, ... }: {

	hardware.enableAllFirmware = true; #ensures all device firmware works

	security.rtkit.enable = true; #realtime kit for pulseaudio

	#Enable pipewire with alsa for lightweight audio
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
