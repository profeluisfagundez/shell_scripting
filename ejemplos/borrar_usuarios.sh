#!/bin/bash
#empezando el borrado de usuarios
cantUsuarios=0
echo "Ingrese la cantidad de usuarios que quiere borrar"
read cantUsuarios
while [ $cantUsuarios -ge 1 ]
do
  usuario=Usuario$cantUsuarios
  sudo userdel -r $usuario
  cantAlumnos=$(( $cantAlumnos - 1 ))
done
#borramos el grupo usuarios
sudo groupdel usuarios
