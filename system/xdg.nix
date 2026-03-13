
{ config, lib, ... }: {
	
	# This fixes no icons build error #
	environment.pathsToLink = [ "/share/icons" ];
	
	xdg = {
		icons.enable = lib.mkForce false;
		menus.enable = lib.mkForce false;
		terminal-exec.enable = lib.mkForce false;
		autostart.enable = lib.mkForce false;
	};
}

