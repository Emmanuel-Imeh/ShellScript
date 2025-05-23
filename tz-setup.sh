#!/bin/bash
################################
# Author: Emmanuel Imeh
# Date: 15/04/2025
#
# Script to set up time zone
################################

confirmTZ=$(date)
echo $confirmTZ # print the date before changes

# Save the date to file
output= $(echo "Result for log: $confirmTZ" > ~/Desktop/confirmedTZ.txt)

# Add some additional info
result=$(echo "Hello! $(whoami), you are currently in $(pwd) directory as at the above log details." >> ~/Desktop/confirmedTZ.txt)

# Search for 'UTC' in the file
findUTC=$(grep "UTC" ~/Desktop/confirmedTZ.txt)

# Check for 'UTC' if exist in 
if [[ -n "$findUTC" ]];
then
	config=$(echo "export TZ='Africa/Lagos'" >> ~/.profile) # append the line to .profile to permanently save the Time Zone
	if [[ -n TZ=Africa/Lagos ]]; then
		echo "Done"
		progressMessage="Your current time zone has been set to WAT"
		echo "$progressMessage, Reboot your system to enable changes."
	else
		echo "failed to append"
	fi
else
	echo "Congrat! you are using WAT zone."
fi
echo "Process Successful!"
