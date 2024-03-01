#!/bin/sh

# Author: I dont remember. I found it many years ago without license.
# Modified by: Norbert Kiszka.
# Project home page: https://github.com/norbertkiszka/rigol-screenshot
# Version: 2.1

#TODO: LXI.
#TODO; whiptail to select device.
#TODO: User directories. Second arg - check if it exists and its a directory. If "/" is at the end and its not exists/writeable, then generate error.
#TODO: jpg/png
#TODO: Divide netcat and tail to capture errors (return != 0) from both of them.
#TODO: more visible error output with caps.

# Settings:

# Directory with text files for ip address(es)
scope_ip_directory="${HOME}/.config/scope_ip"

# End of settings and here we go with the code:

# Create directory if it doesn't exist.
mkdir -p $scope_ip_directory

if [ "$1" = "-h" ] \
	|| [ "$2" = "-h" ] \
	|| [ "$3" != "" ] ; then
	echo "Give empty args (no args) to automatically find a Rigol device."
	echo "If second arg is not given, then output file format will be: capture_dd.mm.yyyy_hh:mm:ss_ipOripFilename.bmp"
	echo ""
	echo "Usage: $0 [ip]"
	echo "Usage: $0 [ip] [screenshot filename]"
	echo ""
	echo "Usage: $0 [filename which contains text with ip]"
	echo "Usage: $0 [filename which contains text with ip] [screenshot filename]"
	echo ""
	echo "Scope IP text files should be located in: $scope_ip_directory and it will be added to the path of given ip file name,"
	echo "it should contain only ip address and can have white spaces."
	exit
fi

ip="$1"

scope_ip_file="$scope_ip_directory/$ip"

if [ "$ip" != "" ] && [ -r "$scope_ip_file" ] ; then
	ip=`cat $scope_ip_file` # Grab ip file contents.
	ip=`echo -n $ip` # Trim white spaces.
	if [ "$ip" = "" ] ; then
		echo "Scope ip file [$scope_ip_file] empty or read failure. Check this file contents and try again."
		exit 1
	fi
fi

if [ "$ip" = "" ] ; then
	echo "Searching Rigol scope on local network..."
	# Get the IP automatically - this probably will prompt for a password because of sudo usage.
	ip=`sudo arp-scan -localnet | perl -ne 'print $1 if /(\S+).*Rigol/i'`
	if [ "$ip" = "" ]; then
		echo "ERROR: Could not detect a Rigol device connected to the LAN. Aborting!"
		exit 1
	else
		echo "Found a Rigol at $ip."
	fi
fi

# User can optionally supply a name for the capture.
filename="$2"

if [ "$filename" = "" ] ; then
	# Generate a capture name if not supplied.
	now=`date +%d.%m.%Y_%X`
	filename="capture_${now}"
	if [ "$1" != "" ] ; then
		filename="${filename}_$1";
	fi
else
	# Otherwise just make sure no path/suffix is given.
	filename=`basename $filename`
	filename=`echo $filename | sed -e 's/\..*//'`
fi
filename="${filename}.bmp"

# Many distributions use home directories which are set in ~/.config/user-dirs.dirs
output_dir=$(xdg-user-dir PICTURES)

# If xdg-user-dir somehow didnt work, then do something...
if [ "$output_dir" = "" ] ; then
	output_dir="${HOME}/Images"
fi

# All the captures will go into this directory
#  which is created if it doesn't exist.
output_dir="$output_dir/lab_screenshots"
mkdir -p $output_dir

# Capture.
output="${output_dir}/$filename"
if [ -e $output ]; then
	echo "ERROR: File $output already exists. Delete or move it first. Aborting!"
	exit 1
fi

echo "Capturing from $ip to $output ..."
echo ':display:data?' | netcat -w 20 $ip 5555 | tail -c +12 > $output

return_value=$?
if [ $return_value -ne 0 ]; then
	echo "Capture error."
	exit 1
fi

filesize=`stat -c%s "$output"`
if [ $filesize -eq 0 ]; then
	echo "ERROR: Saved file is empty..."
	exit 1
fi

echo "Capture saved."
