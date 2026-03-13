
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
		./core
		./security		
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
		neofetch
		
		feh 			# feh --bg-scale /path/to/wallpaper.jpg
		rofi	
		
		maim 			#terminal screenshot utility
		slop			#region selector for main

		librewolf
		vlc
		
		legcord			#lightweight alternative discord client
		spotify
	];

	programs.steam = {
		enable = true;
		extraCompatPackages = with pkgs; [
			proton-ge-bin
		];
	};

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
