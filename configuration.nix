
{ config, pkgs, ... }:

let
	#ADD I3 SUPPORT TO POLYBAR
	myPolybar = pkgs.polybar.override {
		i3Support = true;
	};
in
{
imports = [ 
		./leviathan
		./system
		
];		
	nixpkgs.config.allowUnfree = true; 		#needed for nvidia#
	
	#I3 Workspace support for polybar
	environment.systemPackages = with pkgs; [
		myPolybar

		zip
		unzip
		curl
		neovim
		git
		htop
		kitty

		
		feh 			# feh --bg-scale /path/to/wallpaper.jpg
		rofi
		#polybar	
		
		maim 			#terminal screenshot utility
		slop			#region selector for main

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
