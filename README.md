Fusion 360 installer
====================

This script will help install Fusion 360 under wine.

To invoke this script, `cd` to where it resides, and run
```bash
PATH=/path/to/wine/bin bash ./installfusion.bash
```

This will start the installation in a new wine prefix called `prefix` under the current directory.

The installer will stay 'blank' for about 10 minutes, then Fusion will start.

While the installer does its work, you can monitor progress by invoking `du -sm .` regularly.

When it's complete, it should take about 4.1 gigs of disk space.

When Fusion starts, do not log in, kill it with ctrl-c.

The installer may require a bit of 'convincing' to die (i.e. `xkill`, or `ps -aux ...` and `kill -9 ...`).

The installer will generate a script in the current directory. Run it to launch Fusion :
```bash
bash ./runfusion.bash
```

Working wine versions
=====================

The following is a list of reported wine versions that run Fusion 360.

lutris-5.7-11-x86_64
