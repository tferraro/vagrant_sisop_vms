
# Vagrant para la VM de Sistemas Operativos
La guia del "no tengo buen internet para bajarme el archivo del drive"

## Instalá Vagrant
[Vagrant](https://www.vagrantup.com/) es una herramienta que permite armar máquinas virtuales desde contenedores (llamadas cajas) de una VM ya prefabricada y configurarla para con un solo comando, tenerla corriendo y lista para usarse, entre otras de las cuantas funcionalidades que tiene.

Para instalarlo, primero descargalo desde: [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html). Una vez instalado, vagrant va a estar configurado para que podamos acceder desde la consola (si, incluso en windows!).

Pero antes de usarlo, primero necesitamos bajar un plugin para que corra bien, por lo que posicionados en la carpeta del repo de la vm, escribimos en la consola:
- `vagrant plugin install vagrant-reload`


## Armá tu VM!
Aca solo necesitamos 2 comandos para dejar la VM lista para usar con virtualbox (posicionandonos en la carpeta de la vm):

1. `vagrant up` - Que va a bajar toda la información necesaria y va a dejar ya lista y encendida tu vm en VirtualBox.
2. `vagrant halt` - Que es lo mismo que apagar la vm de forma feliz desde VirtualBox

Una vez realizado el primer comando, posiblemente la máquina virtual no aparezca listada en virtualbox. Si eso ocurre, solo hace falta ir al menú `Máquina/Agregar` de VirtualBox y agregar la VM que creamos, que estará ya lista en la ubicación donde VirtualBox guarda sus máquinas virtuales por defecto (Si uno entra a `Archivo/Preferencias/General` se encuentra listada la carpeta por default).