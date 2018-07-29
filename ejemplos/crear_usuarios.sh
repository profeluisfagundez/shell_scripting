#!/bin/bash

#creamos un grupo alumnos
sudo groupadd alumnos
#creamos los usuarios
cantAlumnos=0
echo "Ingrese la cantidad de alumnos que quiere agregar"
read cantAlumnos
while [ $cantAlumnos -ge 0 ]
do
        usuario=Alumno$cantAlumnos
        sudo useradd -g alumnos -d /home/$usuario -m -s /bin/bash $usuario
        passwd -e -d $usuario
        cantAlumnos=$(( $cantAlumnos - 1  ))
done

