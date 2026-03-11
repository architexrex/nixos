
{ config, pkgs, ... }: {

	fonts.packages = with pkgs; [

		fira-sans
		noto-fonts
		dejavu_fonts

		nerd-fonts.fira-code
		nerd-fonts.fira-mono
		
		
		noto-fonts-color-emoji

	];
}

