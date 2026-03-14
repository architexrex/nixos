{ config, pkgs, ... }: {

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

}
