{ config, ... }: {
	
	#services.xserver.displayManager.sessionCommands = ''
  	#	xrandr --output DP-2 --mode 1920x1080 --rate 144
	#'';

	services.xserver.monitorSection = ''
    	Section "Monitor"
      	Identifier "DP-2"     
      	Option "PreferredMode" "1920x1080"
      	Option "TargetRefresh" "144"
    	EndSection
  	'';
}
