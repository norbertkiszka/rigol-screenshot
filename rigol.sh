#!/bin/sh

if [ "$1" = "-h" ]; then
    echo "Usage: $0 [filename]"
    exit
fi

# Get the IP automatically - this will prompt for a password because of sudo usage
ip=`sudo arp-scan -localnet | perl -ne 'print $1 if /(\S+).*Rigol/i'`
if [ "$ip" = "" ]; then
    echo "Could not detect a Rigol device connected to the LAN. Aborting!"
    exit
else
    echo "Found a Rigol at $ip"
fi

# The user can optionally supply a name for the capture
filename="$1"

if [ "$filename" = "" ]; then
    # Generate a capture name if not supplied
    now=`date +%d%m%Y_%X`
    filename="capture_${now}"
else
    # Otherwise just make sure no path/suffix is given
    filename=`basename $filename`
    filename=`echo $filename | sed -e 's/\..*//'`
fi
filename="${filename}.bmp"

# All the captures will go into this directory
#  which is created if it doesn't exist
output_dir="${HOME}/Obrazy/RIGOL"
mkdir -p $output_dir

# Capture
output="${output_dir}/$filename"
if [ -e $output ]; then
    echo "File $output already exists. Delete or move it first. Aborting!"
    exit
fi
echo -n "Capturing..."
echo ':display:data?' | netcat -w 20 $ip 5555 | tail -c +12 > $output
echo "done"

# Let the user know where the output is
echo "capture saved at '${output}'"
