# Before you use this, go see issue [#4](https://github.com/Caliel666/DivaModManager/issues/4)

# [<img alt="Musicdex" width="40px" src="https://raw.githubusercontent.com/Caliel666/DivaModManager/linuxinstallscript/dmmlogo.png" width="40" height="40" align="right"/>](https://github.com/TekkaGB/DivaModManager) What is this?
this is a script that sets up the mod manager on linux using wine

![Screenshot from 2022-06-21 16-25-56](https://user-images.githubusercontent.com/38433434/174881803-7442839c-0571-497f-9535-0551fcb966cc.png)
# Dependancies

● tar

● wget

# How to run?
```
git clone https://github.com/Caliel666/DivaModManager.git
cd DivaModManager
chmod +x divamodmanager-linux.sh
./divamodmanager-linux.sh
```

after running the installer you should have DivaModManager on your applications menu

# Manual installation

# Lutris

1. download my .net5 fork on DMM [here](https://github.com/Caliel666/DivaModManager/releases/latest/)
2. extract the DivaModManager.exe somewhere
3. add a locally installed game

![image](https://user-images.githubusercontent.com/38433434/180066169-b69c805d-a727-4395-8b63-7de3475a43bc.png)

4. add a name and select wine as the runner

![image](https://user-images.githubusercontent.com/38433434/180066293-8d274bac-4618-469e-95da-c7b580530276.png)

5. put the location of the DivaModManager.exe and add a prefix folder and save

![image](https://user-images.githubusercontent.com/38433434/180066724-013ab3a7-67fd-4448-8ba5-e90ce6af0893.png)

6. download [.net5 desktop runtime](https://download.visualstudio.microsoft.com/download/pr/3aa4e942-42cd-4bf5-afe7-fc23bd9c69c5/64da54c8864e473c19a7d3de15790418/windowsdesktop-runtime-5.0.17-win-x64.exe)

8. click on divamodmanager on lutris, at the bottom click in the arrow and run exe inside wine prefix

![image](https://user-images.githubusercontent.com/38433434/180067258-f3319a62-2f3c-496b-b267-f1c6ae8853bf.png)

8. select the .net5 installer you downloaded and install it

10. from your wine prefix you made for DMM, go to `prefix/drive_c/Program Files/dotnet/host/fxr/5.0.17/` and copy hostfxr.dll

12. paste hostfxr.dll in the same folder where DivaModManager.exe is located

![image](https://user-images.githubusercontent.com/38433434/180067598-17f207c4-6272-48fc-a234-67ca9a8d5c47.png)

and done! you should be able to run it on lutris

# Known issues

● you won't be able to run the game via DMM by default, it would require having steam running on wine in the same prefix or some other workaround

● the script is not made with the steam deck in mind, but it can work, let me known on issues or discord if you have any issues with it
