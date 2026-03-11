
{ config, pkgs, ... }: {

	hardware.pulseaudio.enable = false;

	hardware.enableAllFirmware = true;

	security.rtkit.enable = true;

	services = {
		pipewire ={
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			
		};
	};	

	

	#hardware = {
	#	alsa = {
	#		enable = true;
	#		enablePersistence = true; ###-SAVES VOL ON REBOOT-###
	#		#enableOSSEmulation = true; ###-UNCOMMENT IF WOW AUDIO DOESNT WORK-###	
	#	};
	#};
	###-THIS MAY FIX SOUND NOT RESETTING ON BOOT-###
	#system.postBootCommands = ''
	#	alsactl restore
	#'';

#---------------------------------------------------#
}	
