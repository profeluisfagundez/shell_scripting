#!/bin/bash

#*************************************************************************************************************
#PROGRAMADOR: Luis Eduardo Fagúndez
#LICENCIA: GPL3
#*************************************************************************************************************

#Actualización del sistema************************************************************************************
sudo apt-get update && sudo apt-get upgrade
#*************************************************************************************************************

#Instalación de programas*************************************************************************************
sudo apt-get install build-essential vlc libreoffice libreoffice-l10n-es dosbox virtualbox virtualbox-qt virtualbox-dkms cmus xterm default-jre default-jdk steam unrar vim gparted synaptic mame mame-tools mame-extra mess-data htop codeblocks gambas3 python3 chromium-browser chromium-browser-l10n gmusicbrowser gimp openssh-server git git-core kazam arduino arduino-core fritzing scratch cheese kodi liferea soundconverter wget comix inkscape sqlite3 sqliteman 
#*************************************************************************************************************

#Instalar SCREENFETCH*****************************************************************************************
sudo wget -c https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev -O /usr/bin/screenfetch
sudo chmod +x /usr/bin/screenfetch
#*************************************************************************************************************

#Configurar MAME**********************************************************************************************
# En caso de no usar el wget, al archivo mame.ini se le debe cambiar al rompath $HOME/mame/roms 
# por $HOME/.mame/roms luego de crear el archivo con mame -cc
#cd ~/.mame && mame -cc
mkdir -p $HOME/.mame/{nvram,memcard,roms,inp,comments,sta,snap,diff}
wget -c https://raw.githubusercontent.com/progLuisFagundez92/ShellScripting/master/archivos_config/mame.ini -O /$HOME/.mame/mame.ini 
#*************************************************************************************************************

#Configurando VIM*********************************************************************************************
touch .vimrc
echo "syntax on" >> .vimrc
echo "set tabstop=4" >> .vimrc
echo "set number" >> .vimrc
echo "set shiftwidth=4" >> .vimrc
echo "set autoindent" >> .vimrc 
echo "set encoding=utf-8" >> .vimrc 
#*************************************************************************************************************

#Configurando DOSBOX******************************************************************************************
mkdir /$HOME/.dosbox
mkdir /$HOME/msdos
wget -c https://raw.githubusercontent.com/progLuisFagundez92/ShellScripting/master/archivos_config/dosbox-0.74.conf -O /$HOME/.dosbox/dosbox-0.74.conf
#*************************************************************************************************************

#Creando directorios necesarios para trabajar*****************************************************************
mkdir -p /$HOME/Software/{Debs,Otros}
mkdir /$HOME/Pendrive
mkdir /$HOME/Git
mkdir /$HOME/ISOs
#*************************************************************************************************************

#Creando alias en el sistema**********************************************************************************
echo "#Alias del usuario" >> ~/.bashrc
echo 'alias listar="ls -la"' >> ~/.bashrc
echo 'alias rmi="rm -ri"' >> ~/.bashrc
echo 'alias tarjvideo="sudo lshw -C display"' >> ~/.bashrc
echo 'alias instalardeb="sudo dpkg -i"' >> ~/.bashrc
echo 'alias actualizar="sudo apt-get update && sudo apt-get upgrade"' >> ~/.bashrc
echo 'alias instalar="sudo apt-get install"' >> ~/.bashrc
#*************************************************************************************************************

#Instalación de Spotify***************************************************************************************
clear
echo "Se comenzara la instalación de spotify en 5 segundos"
sleep 5
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
#*************************************************************************************************************

#Instalación de ClipGrab***************************************************************************************
clear
echo "Se comenzara la instalación de ClipGrab en 5 segundos"
sleep 5
sudo add-apt-repository ppa:clipgrab-team/ppa
sudo apt-get update
sudo apt-get install clipgrab
#*************************************************************************************************************

#Instalación de MYSQL-SERVER**********************************************************************************
clear
echo "Desea instalar Mysql-Server? s / n"
read opc
if [ $opc = 's' ]; then
    echo -e "Comenzando instalación: \n"
    sudo apt-get install mysql-server
else
    echo "instalada cancelada"
fi
#*************************************************************************************************************

#Instalación de MYSQL Workbench*******************************************************************************
clear
echo "Desea instalar Mysql-Workbench? s / n"
read opc
if [ $opc = 's' ]; then
    echo -e "Comenzando instalación: \n"
    sudo apt-get install mysql-workbench
else
    echo "instalada cancelada"
fi
#*************************************************************************************************************

#Creando alumnos al sistema***********************************************************************************
clear
echo "Desea agregar alumnos a su sistema? s / n"
read opc
if [ $opc = 's' ]; then
    cantAlumnos=0
    echo "Ingrese la cantidad de alumnos que quiere agregar"
    read cantAlumnos
    while [ $cantAlumnos -ge 1 ]
    do
            usuario=Alumno$cantAlumnos
            sudo useradd -g alumnos -d /home/$usuario -m -s /bin/bash $usuario
            passwd -e -d $usuario
            cantAlumnos=$(( $cantAlumnos - 1  ))
    done
else
    echo "Operación cancelada"
fi
#*************************************************************************************************************

clear
echo "Se ha terminado por completo la instalación y configuración del sistema"
read a
echo
