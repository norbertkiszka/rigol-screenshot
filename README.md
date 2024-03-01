## What is this?

This is a simple Linux shell script that Im using sometimes to capture screenshots from oscilloscopes via network.

Tested with Rigol DS1054Z and Rigol DHO924S. If You tried on other machines, please let me know - despite of results.

## Required hardware

1. At least one oscilloscope...
2. Working network connection with scope.
3. Any computer with Linux/GNU based system. Theoretically it should work with other *nix systems with GNU software, because its not "bash-only".
4. About 5-15 minutes of time.

## How to use it

1. Check scope ip address - if You dont know how to find/set it, then read manual of Your current device. Every device is different.
2. Test network connection via ping. Just open a console or terminal and type ping putYourScopeIpAdressHere [enter...].
3. Put file rigol.sh anywhere You want. But...
4. File rigol.sh should have read and execution permissions. You can do it like this: \
chmod a+rx rigol.sh
5. Script can be anytime executed via shell console (text terminal) like any other script. Some examples: \
rigol.sh \
./rigol.sh \
/home/user-name/some-directory/rigol.sh \
sh rigol.sh
6. All files will be saved in ${HOME}/Images/RIGOL (${HOME} means Your home directory) with date and time in filename - unless second arg with filename is provided.
7. You can give argument(s) with other file name, ip address or file name which contains ip address. Use -h argument (./rigol.sh -h or rigol.sh -h) to know how to use it.
8. This script is capable of reading stored ip addresses in text files. Just give a filename of this text file in first arg. Default hardcoded location is: /home/YourUserName/.config/scope_ip/nameOfTextFileWithOscilloscopeIpAddress. 
9. Also You can create some graphical activator (shortcut) if You prefer/want to click/touch instead of calling it in terminal. Example is in next chapter below...

## Graphical activator in MATE (fork of Gnome 2)

![Mate activator settings](https://github.com/norbertkiszka/rigol-screenshot/raw/master/MATE-activator.png)

## Some screenshots made with this script

![Example1](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_09022020_15:57:26.bmp)

![Example2](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_19032020_23:27:05.bmp)

![Example3](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_18.02.2024_05:33:33_924.bmp)

## History and licence...

Years ago I found very easy, short and unlicensed script doing basicaly same thing, which I modified, rewrited and modified again. It was unlicenced, so I decided to left it still unlicensed (do what You like with it). Big thanks for primary author, whoever (s)he is.
