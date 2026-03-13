{ config, ... }: {
	
	# USEFUL COMMANDS #  
	# clamscan -r -move=/var/quarantine /home
	# cat /var/log/clamav/clamd.log
	# ls /var/quanrantine
	# sudo rm -r /var/quarantine/*
	
	# INCREASE INOTIFY LIMIT SO CLAMAV CAN SCAN ALL DIRS AND FILES #
	# DEFAULT IS ONLY 8192 ON SOME SYSTEMS AND WILL ERROR IF DIRS GROW #
	# NIX SETS THIS BY DEFAULT BUT THIS IS A SANITY CHECK #
	boot.kernel.sysctl = {
		"fs.inotify.max_user_watches" = 524288;
	};

	# AUTOMATICALLY CREATE LOG & QUARENTINE DIR #
	systemd.tmpfiles.rules = [
    		"d /var/log/clamav 0755 clamav clamav -" 
		"d /var/quarantine 0755 clamav clamav -"
  	];

	services.clamav = {
		
		clamonacc.enable = true; #on access scanning

		daemon = {
			enable = true;
			settings = {
				LogFile = "/var/log/clamav/clamd.log";
				LogTime = true;
				LogVerbose = true;
				LogFileMaxSize = "1G";

				ScanArchive = true;
				DetectPUA = true;

				# ONACCESS SCANNING #
				OnAccessExcludeUname = "clamav";
				OnAccessPrevention = true;
				# DIRS WITH ONACCESS ENABLED #
				OnAccessIncludePath = [
					"/home"
					"/tmp"
				];

				# PERFORMANCE TUNING - NEEDED FOR ONACCESS #
				MaxThreads = 20;
				MaxQueue = 200;
			};
		};
		updater = {
			enable = true;
			frequency = 12;
			interval = "hourly";
		};
		# COMMUNITY DATABASE FOR MALWARE #
		fangfrisch = {
			enable = true;
			interval = "hourly";

		};

		scanner = {
			enable = true;
			interval = "*-*-* 04:00:00";  
			scanDirectories = [
				"/home"
				"/var/lib"
				"/var/tmp"
				"/etc"
				"/tmp"
			];
		};
	};
}


