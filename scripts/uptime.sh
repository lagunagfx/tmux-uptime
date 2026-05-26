#!/usr/bin/env bash

# Description : an abbreviated form for uptime, suitable for tmux status bar
# written by Jorge Barrientos AKA LagunaGFX
# 
# ChangeLog :
# 2026.05.26 - Use general 'uptime' outpur as source since macOS lacks the '--pretty' option.

if [ -z $( which uptime ) ];
then

	# the 'uptime' binary is not present in the system
	printf "-not available-"
	# Exceptional Case EXIT
else
	# General Case START
	UPTIME=$( uptime | awk -F "up " '{print $2}' | awk -F " user" '{print $1}' )

	# Example cases extracted from macOS terminal 10.15.8 ... Are they different from Linux' GNU uptime
	#
	# EXAMPLE="15:31  up 37 secs, 1 user, load averages: 2.56 0.69 0.26"
	# EXAMPLE="16:04  up 34 mins, 1 user, load averages: 1.72 1.73 1.36"
	# EXAMPLE="16:31  up 1 hr, 1 user, load averages: 3.05 2.06 1.92"
	# EXAMPLE="17:17  up  1:47, 1 user, load averages: 0.34 0.36 0.41"
	#
	# UPTIME=$( printf "%s" "$EXAMPLE" | awk -F "up " '{print $2}' | awk -F " user" '{print $1}' )

	if [ ! -z $( printf "%s" $UPTIME | grep day ) ];
	then
		# time elapsed : MORE than ONE DAY
		printf "%sd " $( printf "%s" $UPTIME | awk -F "day" '{print $1}' )
		HOUR_AND_MINUTE=$( printf "%s" $UPTIME | awk -F "day" '{print $2}' | cut -d ',' -f 2 )
	else
		HOUR_AND_MINUTE=$( printf "%s" $UPTIME | cut -d ',' -f 1 )
	fi

	if [ ! -z $( printf "%s" $UPTIME | grep hr ) ];
	then
		# time elapsed is EXACTLY 1 hour
		printf "1h 0m"
	else
		# time elapsed : LESS than ONE HOUR
		if [ ! -z $( printf "%s" $UPTIME | grep min ) ];
		then
			# time elapsed : MORE OR EQUAL than ONE MINUTE
			printf "%sm" $( printf "%s" $UPTIME | awk -F "min" '{print $1}' )
		else
			if [ ! -z $( printf "%s" $UPTIME | grep sec ) ];
			then
				# time elapsed : LESS than ONE MINUTE
				printf "%ss" $( printf "%s" "$UPTIME" | awk -F " sec" '{print $1}' )
			else
				# general case : any HOURS and MINUTES elapsed
				HOUR=$( printf "%s" $HOUR_AND_MINUTE | cut -d ':' -f 1 )
				MINUTE=$( printf "%s" $HOUR_AND_MINUTE | cut -d ':' -f 2 )
				printf "%sh %sm" $HOUR $MINUTE
			fi
		fi
	fi
	# General Case END
fi

# End of Script
