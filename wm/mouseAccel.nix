{ config, ... }: {

	#DISABLE MOUSE ACCELERATION AND CONTROL SPEED#
	services = {
		libinput = {
			enable = true;
			mouse = {
				accelProfile = "flat";
				accelSpeed = "0";
			};
		};
	};
}
