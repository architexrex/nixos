
{ config, pkgs, ... }:

let
	#ADD I3 SUPPORT TO POLYBAR
	myPolybar = pkgs.polybar.override {
		i3Support = true;
	};
in
{
imports = [ 
		./hosts
		./pkgs
		./sec
		./sys
		./wm		
];		
# TESTING ENV DOT FILES #
#environment.etc."/etc/xdg/nvim/init.lua".source = ./notnix/dots/nvim/init.lua;
	# MANUAL NVIM #
	programs = {
		neovim = {
			enable = true;
			configure = {
				customLuaRC = ''
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      				
				vim.opt.guicursor =
        			"n:block-blinkon500-blinkoff500," ..
		       		"i:ver25-blinkon500-blinkoff500," ..
		        	"v:block-blinkon500-blinkoff500," ..
		       	 	"c:hor20-blinkon500-blinkoff500," ..
			        "r:hor20-blinkon500-blinkoff500"	
				'';
			};
		};
	};
	
	

	environment.systemPackages = with pkgs; [
		myPolybar  # import myPolybar var from above #

		zip
		unzip
		curl
		git
		htop
		kitty
		neofetch
		
		python3 # TEST FOR WOW #

		feh 			# feh --bg-scale /path/to/wallpaper.jpg
		rofi	
		
		maim 			#terminal screenshot utility
		slop			#region selector for main

		librewolf
		vlc
		
		legcord			#lightweight alternative discord client
		spotify
	];

#---------------------------------------------------------#
	time.timeZone = "America/Los_Angeles";
#---------------------------------------------------------#
	system.stateVersion = "25.11"; 
}
