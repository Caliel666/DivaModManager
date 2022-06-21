#! /bin/bash
modloader=(
$HOME/.divamodmanager
)
wineprefix=(
$HOME/.divamodmanager/prefix
)
dmm=(
$HOME/.divamodmanager/DivaModManager
)
tempfolder=(
./tmp
)

clear
read -p "Welcome to a shitty installer for DivaModManager by TekkaGB on linux, please note that this is really bad, but it works

*this requires the following dependencies, please install them on your system before you continue:
wine
wget


what do you want to do?

install   >install DivaModManager
run       >runs DivaModManager
remove    >remove DivaModManager
quit      >quit

command> ";
if [ $REPLY == "run" ]; then
    clear
    WINEPREFIX="${wineprefix[@]}" wine "${dmm[@]}/DivaModManager.exe"
    
    read -p "enter "q" to go back
command> ";
    if [ $REPLY == "q" ]; then
    clear;
    ./divamodmanager-linux.sh;
    fi
fi

if [ $REPLY == "install" ]; then
    clear
    read -p "Do you want to install DivaModManager ?
you will be prompted to install .net5, this is an important step.

*please note that if the mod manager tries to auto update, it will break your install

yes/no
command> ";
    if [ $REPLY == "yes" ]; then
    mkdir -p "${tempfolder[@]}";
    mkdir -p "${dmm[@]}";
    wget https://download.visualstudio.microsoft.com/download/pr/3aa4e942-42cd-4bf5-afe7-fc23bd9c69c5/64da54c8864e473c19a7d3de15790418/windowsdesktop-runtime-5.0.17-win-x64.exe -P "${tempfolder[@]}";
    WINEPREFIX="${wineprefix[@]}" wine "${tempfolder[@]}/"windowsdesktop-runtime-5.0.17-win-x64.exe;
    wget https://github.com/Caliel666/DivaModManager/releases/latest/download/DivaModManager.exe -P "${tempfolder[@]}";
    cp "${tempfolder[@]}/DivaModManager.exe" "${dmm[@]}";
    cp "${wineprefix[@]}/drive_c/Program Files/dotnet/host/fxr/5.0.17/hostfxr.dll" "${dmm[@]}";
    rm -rf "${tempfolder[@]}";
    fi
    if [ $REPLY == "no" ]; then
     clear;
    ./divamodmanager-linux.sh;
    fi
    clear
    read -p "All done

enter "q" to go back

command> ";
    if [ $REPLY == "q" ]; then
    clear;
    ./divamodmanager-linux.sh;
         fi
fi

if [ $REPLY == "remove" ]; then
    clear
    read -p "Do you want to remove $wineprefix ?

this will remove everything in that folder, please be careful

yes/no
command> ";
    if [ $REPLY == "yes" ]; then
    rm -rf "${wineprefix[@]}";
    read -p "delete everything in $modloader?

yes/no
command> ";
        if [ $REPLY == "yes" ]; then
            rm -rf "${modloader[@]}";
        fi 
        if [ $REPLY == "no" ]; then
     clear;
    ./divamodmanager-linux.sh;
        fi

    fi
    if [ $REPLY == "no" ]; then
     clear;
    ./divamodmanager-linux.sh;
    fi
    clear
    read -p "All done

enter "q" to go back

command> ";
    if [ $REPLY == "q" ]; then
    clear;
    ./divamodmanager-linux.sh;
         fi
fi

if [ $REPLY == "quit" ]; then
    clear;
    echo bye;
    exit;
fi