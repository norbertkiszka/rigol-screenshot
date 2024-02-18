## What is this?

This is simple Linux shell script that Im using sometimes to capture screenshots from osciloscopes via network.

Tested with Rigol DS1054Z and Rigol DHO924S.

## Required hardware

1. Some osciloscope...
2. Working network connection with scope.
3. Any computer with Linux based system. Theoretically should work with other *nix systems.
4. About 5-15 minutes of time.

## How to use it

1. Put rigol.sh anywhere You want. But...
2. File rigol.sh must have read and execution permissions. You can do it like this: \
chmod a+rx rigol.sh
3. Script can be anytime executed via shell console with something like this: \
rigol.sh \
./rigol.sh \
/home/user-name/some-directory/rigol.sh
4. All files will be saved in ${HOME}/Images/RIGOL with date and time in filename.
5. You can give argument(s) with other file name, ip adress or file name which contains ip address. Use -h argument to know how to use it.
6. Also You can create some graphical activator (shortcut) if You prefer to click/touch.

## Graphical activator in MATE (fork of Gnome 2)

![Mate activator settings](https://github.com/norbertkiszka/rigol-screenshot/raw/master/MATE-activator.png)

## Some screenshots made with this script

![Example1](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_09022020_15:57:26.bmp)

![Example2](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_19032020_23:27:05.bmp)

![Example3](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_18.02.2024_05:33:33_924.bmp)
