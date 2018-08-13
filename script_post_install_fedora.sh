#USO LEGAL DEL SCRIPT
#Este script está pensado como guía de instalación para FEDORA 28
#PROGRAMADOR: Luis Eduardo Fagúndez
#ÚLTIMA FECHA DE MODIFICACIÓN 12/08/2018

#***********************************************************************************************************************************
#RECOMENDACIONES CON RESPECTO A JAVA
#Es recomendable bajar la JDK y JRE De JAVA De la página oficial de Oracle en caso de trabajar con la version 8
#Se debe de usar el comando rpm seguido del modicador -ivh junto a la ruta del archivo rpm para instalar tanto la JDK como la JRE
#ejemplo de instalación usando el comando rpm para la JDK y JRE 8u181
# rpm -ivh jdk-8u181-linux-x64.rpm
# rpm -ivh jre-8u181-linux-x64.rpm
#Luego de eso, es importante configurar JAVA_HOME, primero se debe de usar el comando: "alternatives --config java" para establecer
#que versión de JAVA de las que tenemos instaladas en el sistema vamos a usar por defecto, luego de eso vamos a editar el archivo 
# /etc/profile y agregale lo siguiente al final:
# export JAVA_HOME="/usr/java/latest"
# Luego de esto ya tendremos JAVA instalado en nuestro sistema Java para trabajar. 
#***********************************************************************************************************************************
#https://innovatronikms.com/que-hacer-despues-de-instalar-fedora-28/
#arduino arduino-core

#repositorio rpmfusion
dnf -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#repositorio Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

#Herramientas basicas de desarrollo general
yum groupinstall "Development Tools" "Development Libraries"

#herramientas de ofimatica libreoffice
dnf install libreoffice-data.noarch libreoffice-core.x86_64 libreoffice-langpack-es.x86_64 libreoffice

#herramientas basicas a nivel de usuario
dnf install dosbox cmus vlc htop gimp vim unrar unzip cmus gparted git cheese scratch wget inkscape screenfetch steam kodi liferea soundconverter firefox gmusicbrowser openssh-server firefox mencoder ffmpeg 

#herramientas basicas para desarrollar en python
dnf install vim python3 python3-devel python3-tkinter python3-pip python3-virtualenv

#motor mariaDB
dnf install mariadb mariadb-server
#iniciar por primera vez
systemctl start mariadb.service
#habilitar el inicio siempre
systemctl enable mariadb.service
#configurar la instancia
/usr/bin/mysql_secure_installation

#virtualbox
dnf -y install kernel-headers kernel-devel dkms gcc
dnf -y install VirtualBox

#codecs
dnf -y install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-libav gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-ugly-free
