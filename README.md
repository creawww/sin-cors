# SIN-CORS

Un entorno docker para trabajar con Ruby y SINATRA

contenedor preparado para trabajar con Ruby:2.5.1

Si necesitar otra version simplemente cambia la primera linea del dockerfile

FROM ruby:2.5.1

## construir la imagen si no existe

La primera vez que clonamos el repo necesitamos construir la imagen con nombre propio.

Si construimos la imagen con nombre se quedara en nuestro sistema y podremos usarla para todos los proyectos que la necesitemos

    docker build . -t myruby

## arrancar el contenedor

    docker run -it --rm --name=myapp -p 3000:3000 -v $PWD:/home/myuser/app -v $PWD/_bundle:/usr/local/bundle myruby /bin/bash

Para no tener que escribir un comando tan largo he creado un **runDocker.sh**

    ./runDocker.sh

Cuando ejecutamos el script o el comando se nos abre un terminal y estamos dentro del contenedor en el que tenemos Ruby, y comparte con nuestro equipo la carpeta actual y la carpeta _bundle, donde se le dan persistencia a las gemas.

Tenemos que trabajar los comando Ruby dentro del contenedor

# Ejemplo de iniciar app

    bundle install


add al .gitignore el directorio _bundle

    /_bundle/*

## CORRER EL servidor

		bundle exec puma -C puma.rb

y accedemos en el navegador a la url http://localhost:3000


                                      YA TENEMOS NUESTRO CORRIENDO !!


Para apagar el servidor Ctrl-C
