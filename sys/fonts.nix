
{ config, pkgs, ... }: {

	fonts = {
		# 32 BIT SUPPORT #
		fontconfig.cache32Bit = true;

		packages = with pkgs; [

			fira-sans
			noto-fonts
			dejavu_fonts
			
			nerd-fonts.fira-code
			nerd-fonts.fira-mono
		
			nerd-fonts.symbols-only
			noto-fonts-color-emoji

		];
	};
}

