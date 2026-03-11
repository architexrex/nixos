
{ config, pkgs, ... }: {

	hardware = {
		alsa = {
			enable = true;
			enablePersistence = true; ###-SAVES VOL ON REBOOT-###
			#enableOSSEmulation = true; ###-UNCOMMENT IF WOW AUDIO DOESNT WORK-###	
		};
		enableAllFirmware = true;  ###-ENSURE ALL DEVICES WORK-###
	};
	
	environment.systemPackages = with pkgs; [

	
	];

	###-THIS MAY FIX SOUND NOT RESETTING ON BOOT-###
	#system.postBootCommands = ''
	#	alsactl restore
	#'';

#---------------------------------------------------#
}	
