# Guía para levantar el entorno de la materia optativa en Windows

Esta guia considera el segundo método de instalación

> En tu computadora con Docker compose

**Requisitos**:
* Para tener disponible este repositorio en tu maquina de trabajo e instalar el software de la materia hay que instalar el programa [git](https://git-scm.com/download/win).
* [Docker compose](https://docs.docker.com/desktop/install/windows-install/).

* Clonar el repositorio: 

```bash
git clone https://bitbucket.org/bigdata_famaf/diplodatos_bigdata.git
``` 

Asegurarse de tener las siguientes características de windows habilitadas:

![Características de windows](imgs/captura_1.jpg)

Software recomendado para interactuar con todos los recursos de la materia (en windows): [vscode](https://code.visualstudio.com/) y [powershell](https://learn.microsoft.com/es-es/powershell/scripting/overview?view=powershell-7.3) (la guía hace uso de ambas).

---
## Para limitar los recursos que utiliza docker en windows

Primero asegurarse que docker está "apagado" y toda instancia de *wsl2* también (en la terminal: ```wsl --shutdown```).

Vamos al explorador de archivos y escribimos lo siguiente:
![profile dir](imgs/captura_10.jpg)

*%UserProfile%* para ir al directorio en donde crearemos el siguiente archivo: ```.wslconfig``` y en el cual pegaremos lo siguiente:

```
[wsl2]
processors=4
memory=5GB
```
con esto docker utilizará como máximo 4 procesadores (virtuales) y 5GB de memoria RAM. Pueden modificar estos valores teniendo en cuenta que Spark necesita un mínimo para funcionar bien.

---
## Levantamos el entorno

Ejecutamos **vscode** y luego abrimos el directorio con el repo de la materia:

![Abriendo directorio en vscode](imgs/captura_2.jpg)

Deberiamos ver el directorio a la izquierda con todos los archivos que se descargaron desde el repositorio:

![Archivos del repo en vscode](imgs/captura_3.jpg)

Abrimos una terminal con la combinación de teclas ```Ctrl + Ñ```. En este caso la terminal es de tipo *powershell*.

![terminal en vscode](imgs/captura_4.jpg)

Desde la terminal nos movemos al directorio ```/docker/compose```.

![cd docker compose](imgs/captura_5.jpg)

En ese directorio ejecutamos el siguiente comando:

```bash
docker compose up --build
```

Veremos varias líneas de log en la terminal, si queremos detener los contenedores debemos hacer ```Ctrl + C```

![output docker compose up build](imgs/captura_6.jpg)

Luego debemos ir al navegador y escribir [http://localhost:8080](http://localhost:8080) para ver el entorno Zeppelin e interactuar con los notebooks. Recuerden que los notebooks se encuentran en la carpeta *clases* del repositorio y tienen la extensión ```.zpln```

## Para abrir una terminal en el contenedor

Mientras los contenedores están corriendo, abrimos una segunda terminal haciendo click en el botón '+' como se muestra en la siguiente imagen

![agregar una terminal](imgs/captura_7.jpg)

Veremos en un panel a la derecha todas las terminales que tenemos abiertas y podemos alternar entre ellas. 

![exec bash](imgs/captura_8.jpg)

En la nueva terminal escribimos el siguiente comando:

```bash
docker exec -it diplodatos_bigdata bash
```

>Este comando docker ejecuta (*exec*) un shell interactivo (*bash*) en un contenedor (en este caso el de la materia: *diplodatos_bigdata*). 

>El argumento ```-it``` se utiliza para abrir una sesión interactiva (TTY) en el contenedor. El indicador -i (interactive) permite la interacción con la terminal del contenedor, y el indicador -t (pseudo-TTY) asigna un terminal pseudo-TTY, lo que permite la entrada y salida interactiva (según documentación).

veremos el prompt de la terminal del contenedor *diplodatos_bigdata* y podemos empezar a ejecutar comandos. Para salir de la terminal podemos usar el comando ```exit``` o la combinación de teclas ```Ctrl + D```

![prompt](imgs/captura_9.jpg)

---

## Para conectarse remotamente por ssh
Esto considera que vas por la opción 4 de instalación del entorno y es para utilizar *vscode* para conectarte por ssh y para crear un tunel ssh para port forwarding.

**Requisitos**

- [Servidor OpenSSH](https://learn.microsoft.com/es-mx/windows-server/administration/openssh/openssh_install_firstuse)

para abrir el menú de conexión remota, hacer click en el icono que muestra la imágen del borde inferior izquierdo de vscode:

![](imgs/captura_11.jpg)

esto abrirá una ventana en la cual debemos seleccionar *Connect to Host...*

![connect to host](imgs/captura_12.jpg)

luego *Add New SSH Host...*

![add new ssh host](imgs/captura_13.jpg)

en la ventana que se abre ingresamos el comando para conectarse remotamente por ssh con los datos que les pasamos de las máquinas remotas

![add ssh data](imgs/captura_14.jpg)

A continuación podemos agregar los datos en un archivo *config* en el directorio *.ssh* para guardar la conexión con el formato:

```
Host <nombre>
    HostName <ip>
    User <usuario>
```
## Para crear el tunel ssl con vscode

Seguir [esta guía](https://code.visualstudio.com/docs/remote/ssh#_forwarding-a-port-creating-ssh-tunnel).