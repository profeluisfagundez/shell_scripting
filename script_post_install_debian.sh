#!/bin/bash

#*************************************************************************************************************
#*****************************README**************************************************************************

#Actualización y instalación de programas en un sistema operativo Debian
#con este script se instalaran los programas básicos para trabajar y se hacen algunas
#configuraciones básicas pero necesarias para un buen funcionamiento del sistema. 

#PROGRAMADOR: Luis Eduardo Fagúndez
#FECHA DE ÚLTIMA MODIFICACIÓN: 12/08/2017
#LICENCIA: GPL3

#*************************************************************************************************************

#Actualización del sistema************************************************************************************
sudo apt-get update && sudo apt-get upgrade
#*************************************************************************************************************

#Instalación de programas*************************************************************************************
#BUILD-ESSENTIAL // Herramientas necesarias para compilación de software entre otros
#VLC // Reproductor de video
#LIBREOFFICE // Suite de offimatica
#DOSBOX // Emulador de MS-DOS
#CMUS // Reproductor de música desde consola
#DEFAULT-JRE // JRE para ejecutar programas creados en Java
#DEFAULT-JDK // JDK para programar en Java
#UNRAR // Para descomprimir archivos
#XTERM // Para usar code::blocks
#VIM // Editor de texto plano desde consola
#GPARTED // Particionador de discos
#SYNAPTIC // Gestor de paquetes modo gráfico
#MAME // Emulador de maquinas recreativas
#HTOP // Igual al clásico top pero con más funciones
#GAMBAS3 // Lenguaje de programación Gambas3
#PYTHON3 // Lenguaje de programación Python 3
#CHROMIUM // Navegador web Chrome en su versión libre
#GMUSICBROWSER // Reproductor de música
#GIMP // Programa para diseño gráfico
#OPENSSH-SERVER // Conexiones remotas usando SSH
#VIRTUALBOX //Programa para crear maquinas virtuales
#GIT // Programa de control de versiones
sudo apt-get install build-essential vlc libreoffice libreoffice-l10n-es dosbox cmus xterm default-jre default-jdk unrar vim gparted synaptic mame mame-tools mame-extra mess-data htop gambas3 python3 chromium chromium-l10n gmusicbrowser gimp openssh-server virtualbox git git-core
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
wget -c https://raw.githubusercontent.com/progLuisFagundez92/ShellScripting/master/mame.ini -O /$HOME/.mame/mame.ini 
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

#Configurando JAVA********************************************************************************************
#echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"' >> /etc/environment 
#source /etc/environment
#*************************************************************************************************************

#Configurando DOSBOX******************************************************************************************
mkdir /$HOME/.dosbox
mkdir /$HOME/msdos
wget -c https://raw.githubusercontent.com/progLuisFagundez92/ShellScripting/master/dosbox-0.74.conf -O /$HOME/.dosbox/dosbox-0.74.conf
#*************************************************************************************************************

#Creando directorios necesarios para trabajar*****************************************************************
mkdir -p /$HOME/INET/{Materias,Recursos}
mkdir -p /$HOME/Programacion/{Java,C++,Web,ShellScripting,Python} 
mkdir -p /$HOME/Secundaria/{Primero,Segundo}
mkdir -p /$HOME/UTU/{SistemasOperativos,SistemasOperativosII,SistemasOperativosIII,ProgramacionI,ProgramacionII,ProgramacionIII}
#*************************************************************************************************************

#Creando alias en el sistema**********************************************************************************
echo "comprobando si existe el archivo .bashrc"
bashrc=~/.bashrc
if [ -f $bashrc ]; then
	echo "El archivo existe, creando alias"
	echo "#Alias del usuario" >> ~/.bashrc
	echo 'alias listar="ls -la"' >> ~/.bashrc
	echo 'alias rmi="rm -ri"' >> ~/.bashrc
	echo 'alias tarjvideo="sudo lshw -C display"' >> ~/.bashrc
	echo 'alias instalardeb="sudo dpkg -i"' >> ~/.bashrc
	echo 'alias actualizar="sudo aptitude update && sudo aptitude upgrade"' >> ~/.bashrc
else
	echo "El archivo no existe"
	touch /$HOME/.bashrc
	echo "#Alias del usuario" >> ~/.bashrc
	echo 'alias listar="ls -la"' >> ~/.bashrc
	echo 'alias rmi="rm -ri"' >> ~/.bashrc
	echo 'alias tarjvideo="sudo lshw -C display"' >> ~/.bashrc
	echo 'alias instalardeb="sudo dpkg -i"' >> ~/.bashrc
	echo 'alias actualizar="sudo aptitude update && sudo aptitude upgrade"' >> ~/.bashrc
fi
#*************************************************************************************************************

#Creando alumnos al sistema***********************************************************************************
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
#*************************************************************************************************************

echo
echo "Se ha terminado por completo la instalación y configuración del sistema"
read a
echo
