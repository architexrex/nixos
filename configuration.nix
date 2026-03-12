
{ config, pkgs, ... }:

{
imports = [ 
		./leviathan
		./system
		
];
		
	# $ nix search wget
	nixpkgs.config.allowUnfree = true; 		#needed for nvidia#
	environment.systemPackages = with pkgs; [
		
		zip
		unzip
		curl
		neovim
		git
		htop
		kitty

		
		feh 			# feh --bg-scale /path/to/wallpaper.jpg
		rofi
		polybar	
		

		librewolf
		vlc
		
		steam
		legcord			#lightweight alternative discord client
		spotify
	];

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};
	

  	users.users.admiral = {
    		isNormalUser = true;
    		description = "admiral";
    		extraGroups = [ 
			"networkmanager" 
			"wheel"
			"audio"
			"video"
			"input"
			"storage"
			#"lp" #printer access
		];
		#packages = with pkgs; [];
  	};
 	
#---------------------------------------------------------#
	time.timeZone = "America/Los_Angeles";
#---------------------------------------------------------#
	system.stateVersion = "25.11"; 
}
