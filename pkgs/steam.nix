{ config, pkgs, ... }: {
	
	# ENABLE STEAM WITH GLORIOUS EGROLL PROTON #
	programs.steam = {
		enable = true;
		extraCompatPackages = with pkgs; [
			proton-ge-bin
		];
	};
}
