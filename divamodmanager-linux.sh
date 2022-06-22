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
wine=(
$HOME/.divamodmanager/wine
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
    WINEPREFIX="${wineprefix[@]}" "${wine[@]}/lutris-GE-Proton7-16-x86_64/bin/wine64" "${dmm[@]}/DivaModManager.exe"
    
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
    mkdir -p "${wine[@]}";
    wget https://github.com/GloriousEggroll/wine-ge-custom/releases/latest/download/wine-lutris-GE-Proton7-16-x86_64.tar.xz -P "${tempfolder[@]}";
    bsdtar -xJv -f "${tempfolder[@]}/wine-lutris-GE-Proton7-16-x86_64.tar.xz " -C "${wine[@]}"
    wget https://download.visualstudio.microsoft.com/download/pr/3aa4e942-42cd-4bf5-afe7-fc23bd9c69c5/64da54c8864e473c19a7d3de15790418/windowsdesktop-runtime-5.0.17-win-x64.exe -P "${tempfolder[@]}";
    WINEPREFIX="${wineprefix[@]}" "${wine[@]}/lutris-GE-Proton7-16-x86_64/bin/wine64" "${tempfolder[@]}/"windowsdesktop-runtime-5.0.17-win-x64.exe;
    wget https://github.com/Caliel666/DivaModManager/releases/latest/download/DivaModManager.exe -P "${tempfolder[@]}";
    cp "${tempfolder[@]}/DivaModManager.exe" "${dmm[@]}";
    cp "${wineprefix[@]}/drive_c/Program Files/dotnet/host/fxr/5.0.17/hostfxr.dll" "${dmm[@]}";
    rm -rf "${tempfolder[@]}";
    chmod +x ./run_divamodmanager.sh;
    cp ./run_divamodmanager.sh "${modloader[@]}";
    sed -i "s#prefix#${wineprefix[@]}#g" "${modloader[@]}/run_divamodmanager.sh";
    sed -i "s#wine#${modloader[@]}/${wine[@]}/lutris-GE-Proton7-16-x86_64/bin/wine64#g" "${modloader[@]}/run_divamodmanager.sh";
    sed -i "s#DivaModManager.exe#${modloader[@]}/${dmm[@]}/DivaModManager.exe#g" "${modloader[@]}/run_divamodmanager.sh";
    clear
    read -p "Do you wish to add it to your applications menu?
don't do it if you are on a steam deck

yes/no
command> ";
        if [ $REPLY == "yes" ]; then
        sudo mkdir -p /usr/share/applications/;
        sudo mkdir -p /usr/share/pixmaps/;
        sudo cp ./divamodmanager.desktop /usr/share/applications/;
        sudo cp ./dmmlogo.png /usr/share/pixmaps/;
        sed -i "s#run_divamodmanager.sh#${modloader[@]}/run_divamodmanager.sh#g" /usr/share/applications/divamodmanager.desktop;
        fi
        if [ $REPLY == "no" ]; then
        clear;
        ./divamodmanager-linux.sh;
        fi
        clear;
        read -p "All done

enter "q" to go back

command> ";
        if [ $REPLY == "q" ]; then
        clear;
        ./divamodmanager-linux.sh;
        fi
    fi

    if [ $REPLY == "no" ]; then
     clear;
    ./divamodmanager-linux.sh;
    fi
    clear;
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
            sudo rm -rf /usr/share/applications/divamodmanager.desktop;
            sudo rm -rf /usr/share/pixmaps/dmmlogo.png;
            
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