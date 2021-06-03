# Introduction

**Docker is an easy way to share an application**. You will pack
your app with a configuration in a ``Dockerfile`` and it will
create a Docker image.

Then any machine that has `docker` can run your image, meaning your application can be run everywhere.

<div class="sr"></div>

## Some additional details

A virtual machine allows someone to have a Linux desktop on Windows, for instance, so one can start a Linux-only application in Windows.

But a virtual machine may be too much to install, so ``docker`` is a mix between those. It will use your current machine so your system file, RAM, CPU ... to run a container that can have a Windows, Linux, ... system running in it.

But a ``docker`` image doesn't have a memory so each time you start a `container`, so each time you run your application, **it will restart from scratch**.

Also a downside a ``docker``, that I least stumbled upon was it was quite
hard and impossible for me to use some system-specific devices such as
sound (<span class="text-muted small">at least in Windows but in Linux or macOS it seems to be possible</span>).

<div class="sl"></div>

## Install Docker

Firstly, ready the official documentation might help better
then I do so read it here
[https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/).

* check if installed with ``docker -v``
* on windows

    * install [Docker desktop](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
    * you need to restart it each time your want to use ``docker`` commands
    * when the application is started, confirmation messages should be shown 
    then you can use ``docker`` commands

<div class="sr"></div>

## Some commands you need to know

* ``docker pull tag`` : download an image
* ``docker build -t tag .`` : build an image named `tag` with
the ``DockerFile`` in the current folder
* ``docker build -t tag:version .`` : specify tag version
when building
* ``docker run -it tag`` : run `tag` image in interactive mode, for instance
a bash were you can input commands is interactive
* ``docker run tag`` : run `tag`

You can find images here [https://hub.docker.com/](https://hub.docker.com/)
that you can use as a base for your application, for example, there is
an image called ``gcc`` if you need a system configured and with `gcc`
available.

Other commands that one might use

* ``docker ps``: list of running containers with their ID
* ``docker rm id``: end of running container
* ``docker run -p ps:pm tag``: start image and bind port
of your container ``ps`` with one of your machine `pm`.

<div class="sl"></div>

## Dockerfile

Here an example of a ``Dockerfile``

```dockerfile
# source image
FROM debian:10

# set the working directory
WORKDIR path

RUN commande # exécute une commande
RUN commande_part_1 \
# si the the second part of the line above
commande_part_2

# add files to container file system
ADD path/to/source path/to/dest
# copy file to container file system
COPY path/to/source path/to/dest

# allow the use of port 80=HTTP outside
EXPOSE 80

# a command that's called when the container is run
CMD ["command", "arg"]
```

So try to make it like that

* instruction in uppercase, followed by their arguments
* you can split a long line with ``\ ``.
* the first line is a ``FROM`` with the image we use as a source,
that you may have to download if you don't have it (the `docker pull tag`
done automatically if you didn't)

<div class="sr"></div>

### Most used instructions

Voici un résumé de quelques instructions, vous avez tous les détails plus bas

* [FROM](tags/from.md) : source image
* [WORKDIR](tags/workdir.md) : change workdir
* [ADD](tags/add.md) : add files
* [COPY](tags/copy.md) : copy files
* [RUN](tags/run.md) : run a command
* [CMD](tags/cmd.md) : run a command when container is started
* [ENV](tags/env.md) : set environnement variables

Less commonly used

* [EXPOSE](tags/expose.md) : link/expose a port
* [USER](tags/user.md) : create user
* [LABEL](tags/label.md) : image metadata
* [VOLUME](tags/volume.md)` : create a mounting point (`/mnt` such as WSL is doing)

You may use

* [ONBUILD](tags/onbuild.md) 
* [STOPSIGNAL](tags/stopsignal.md) 
* [ENTRYPOINT](tags/entrypoint.md)

And these are not ``commands`` but may
be useful

* [Arguments](tags/args.md)
* [Directives](tags/directives.md)

<div class="sl"></div>

## Other

### Kubernetes

I still haven't learned how to use it so nothing for now
but from what I know
you can use ``Kubernetes`` to make sure that there are
always ``x`` instances of an image running.

### .dockerignore

You may have files that you don't want ``Docker`` to copy
so you may use a ``.dockerignore`` using the `.ignore`
syntax

````gitignore
# any file someting.exe is ignore
*.exe
# we don't ignore a.exe
!a.exe
# exclude a directory
directory/
````

<div class="sr"></div>

### Real docker example 

From hub.ducker.com

```dockerfile
# image is gcc in an old version
FROM gcc:8.4
# copy your project in /usr/src/myapp
COPY . /usr/src/myapp
# then we move to this folder ...
WORKDIR /usr/src/myapp
# ... in order to compile without writing /usr/src/myapp/main.c
# or /usr/src/myapp/myapp since the current folder is /usr/src/myapp/
RUN gcc -o myapp main.c # génère notre exécutable
# when started with call our program
CMD ["./myapp"]
```

<div class="sl"></div>

## Sources

* Denis CLAVIER ([ENSIIE](https://www.ensiie.fr/) student)
* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)

And links used are

* [docs.docker.com](https://docs.docker.com/)
* [Kubernetes](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)
* [hello-world](https://github.com/docker-library/hello-world/blob/master/Dockerfile.build)
* [C-build](https://ownyourbits.com/2017/06/20/c-build-environment-in-a-docker-container/)
* [C/C++ build](https://amytabb.com/ts/2018_07_28/)
* [webapps](https://github.com/docker/labs/blob/master/beginner/chapters/webapps.md)
* [IMUNES](https://github.com/imunes/vroot-linux)
* [webapps](https://github.com/docker/labs/blob/master/beginner/chapters/webapps.md)
