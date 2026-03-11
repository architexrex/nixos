
{ config, pkgs, ... }: {

	hardware.pulseaudio.enable = false; #pulseaudio required for bluetooth headset

	hardware.enableAllFirmware = true; #ensures all device firmware works

	security.rtkit.enable = true; #realtime kit for pulseaudio

	#Enable pipewire with alsa for lightweight audio
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
