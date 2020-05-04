## What is this?

This is simple Linux shell script that Im using sometimes to capture screenshots from osciloscope Rigol DS1054Z via network.

## Required hardware

1. Some Rigol osciloscope.
2. Working network connection - via router (computer can be via wifi) or directly - first check this connecton via ICMP (ping).
3. Any computer with (almost) Linux based system.
4. About 10-15 minutes of time.

## How to use it

1. Put rigol.sh anywhere You want. But...
2. File rigol.sh must have read and execution permissions. You can do it like this: \
chmod a+rx rigol.sh
3. Script can be anytime executed via Linux shell console with something like this: \
rigol.sh \
./rigol.sh \
/home/user-name/some-directory/rigol.sh
4. All files will be saved in ${HOME}/Obrazy/RIGOL with date and time in filename.
5. Also You can create some graphical activator...

## Graphical activator in MATE (fork of Gnome 2)

![Mate activator settings](https://github.com/norbertkiszka/rigol-screenshot/raw/master/MATE-activator.png)

## Some screenshots made with this script

![Example1](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_09022020_15:57:26.bmp)

![Example2](https://github.com/norbertkiszka/rigol-screenshot/raw/master/examples/capture_19032020_23:27:05.bmp)
