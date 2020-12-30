#! /bin/bash

_WINEARCH=win64
_WINEPREFIX=$(pwd)/prefix

if ! type -p wine 1>/dev/null 2>&1
then
    #whiptail --msgbox "wine is not in path" 0 0
    echo "wine is not in path"
    exit 1
fi
_WINE=$(type -p wine)

if ! type -p wineboot 1>/dev/null 2>&1
then
    #whiptail --msgbox "wineboot is not in path" 0 0
    echo "wineboot is not in path"
    exit 1
fi
_WINEBOOT=$(type -p wineboot)

if ! type -p winetricks 1>/dev/null 2>&1
then
    #whiptail --msgbox "winetricks is not in path" 0 0
    echo "winetricks is not in path"
    exit 1
fi
_WINETRICKS=$(type -p winetricks)

if [ ! -f "Fusion 360 Client Downloader.exe" ]
then
    #whiptail --msgbox "Fusion 360 client downloader is not present in current directory, it will now be downloaded using wget" 0 0 
    echo "Fusion 360 client downloader is not preset in current directory.\nPress a key to download with wget."
    read
    wget https://dl.appstreaming.autodesk.com/production/installers/Fusion%20360%20Client%20Downloader.exe
fi

cat <<EOS >runfusion.bash
#! /bin/bash

export WINEARCH=${_WINEARCH}
export WINEPREFIX=${_WINEPREFIX}
export PATH=$(dirname ${_WINE}):\${PATH}
$(basename ${_WINE}) ${_WINEPREFIX}/drive_c/users/${USER}/Local\ Settings/Application\ Data/Autodesk/webdeploy/production/6a0c9611291d45bb9226980209917c3d/FusionLauncher.exe
EOS

#whiptail --msgbox "About to install Fusion 360\n\nprefix     : ${_WINEPREFIX}\nwine       : ${_WINE}\nwineboot   : ${_WINEBOOT}\nwinetricks : ${_WINETRICKS}\n\nThe installer will stay 'blank' for about 10 minutes,\nthen Fusion will start.\nDo not log in, kill everything, including the installer.\n\nThen run 'bash ./runfusion.bash'" 0 0 
echo "About to install Fusion 360"
echo ""
echo "prefix     : ${_WINEPREFIX}"
echo "wine       : ${_WINE}"
echo "wineboot   : ${_WINEBOOT}"
echo "winetricks : ${_WINETRICKS}"
echo ""
echo "The installer will stay 'blank' for about 10 minutes, then Fusion will start."
echo "While the installer does its work, you can monitor progress by invoking 'du -sm .' regularly.\n"
echo "When it's complete, it should take about 4.1 gigs of disk space."
echo ""
echo "When Fusion starts, do not log in, kill it with ctrl-c."
echo "The installer may require a bit of 'convincing' to die."
echo ""
echo "Then run 'bash ./runfusion.bash' to start Fusion."
echo ""
echo "Pess a key to begin installation."
read

WINEARCH=${_WINEARCH} WINEPREFIX=${_WINEPREFIX} ${_WINEBOOT}
WINEARCH=${_WINEARCH} WINEPREFIX=${_WINEPREFIX} ${_WINETRICKS} vcrun2017 corefonts wininet winhttp atmlib gdiplus iertutil msxml3 msxml6 urlmon win10 dxvk
WINEARCH=${_WINEARCH} WINEPREFIX=${_WINEPREFIX} ${_WINE} "Fusion 360 Client Downloader.exe"

