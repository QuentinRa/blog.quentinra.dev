# Introduction

**Docker is an easy way to share an application**. You will create a configuration in a **Dockerfile**, and using it, you will create a **Docker image** of your application. Any machine that has **Docker** can run your image, meaning your application can be run everywhere.

A virtual machine allows someone to have a Linux (or ...) desktop on Windows. Once installed, one can start a Linux-only application on Windows. But a virtual machine may be too much according to what you want, and that's where Docker comes in handy. It will use your current machine file system, your RAM, your CPU ... 
to run a container that can have Windows, Linux, or any other system running on it.

Each docker image has its own memory, so each time you create a new container, **it will restart from scratch**. If you restart the same container, then everything you did will still be there ([more explanation on Stack Overflow](https://stackoverflow.com/questions/28574433/do-docker-containers-retain-file-changes)).

A downside of `docker`, at least one that I found, was that it was hard and impossible for me to use some system-specific devices such as sound (<span class="text-muted small">at least in Windows but in Linux or macOS it seems to be possible</span>).

> If you want to use Linux on Windows, install a WSL (Windows subsystem). For instance, you can open the Windows Store,  enter "Debian" and install it.

<hr class="sl">

## Install Docker

Firstly, read the official documentation, it might help more.
Here is the [official installation page](https://docs.docker.com/engine/install/).

* check if installed with `docker -v`
* on Windows
  * install [Docker desktop](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
  * you need to restart it each time you want to use `docker` commands
  * when the application is started, a message should be shown
  telling you that you can use `docker` commands

<hr class="sr">

## Some commands you need to know

* `docker pull tag`: download an image
* `docker build -t tag .`: build an image named `tag` with
the `DockerFile` in the current folder
* `docker build -t tag:version .`: specify tag version
when building
* `docker run -it tag`: run `tag` image in interactive mode,
for instance, a bash (where you can input commands) is interactive
* `docker run tag`: run `tag`

You can find images here [https://hub.docker.com/](https://hub.docker.com/)
that you can use as a base for your application.
As an example, there is an image called `gcc` 
if you need a system configured and with `gcc` command available.

Other commands that you might use

* `docker ps`: list of running containers with their ID
* `docker rm id`: end a running container having the ID "id"
* `docker run -p ps:pm tag`: start image and bind a port
of your container `ps` with your machine port `pm`.

<hr class="sl">

## Dockerfile

Here is an example of a `Dockerfile`

```dockerfile
# source image
FROM debian:10

# set the working directory
WORKDIR path

# run a command
RUN command
RUN command_part_1 \
# the second part of the line above
command_part_2

# add files to container file system
ADD path/to/source path/to/dest
# copy file to container file system
COPY path/to/source path/to/dest

# allow the use of port 80 (=HTTP) outside
EXPOSE 80

# a command that's called when the container is run
CMD ["command", "arg"]
```

Summary

* instruction in uppercase, followed by their arguments
* you can split a long line with `\ `.
* the first line is a `FROM` with the image we use as a source,
that you may have to download if you don't have it 
  * the `docker pull tag` command
  * done automatically when running if you didn't

<hr class="sr">

### Most used instructions

This is a summary of the most used instruction.

* [FROM](tags/from.md): source image
* [WORKDIR](tags/workdir.md): change the working directory
* [ADD](tags/add.md): add files
* [COPY](tags/copy.md): copy files
* [RUN](tags/run.md): run a command
* [CMD](tags/cmd.md): run a command when container is started
* [ENV](tags/env.md): set environment variables

Less commonly used

* [EXPOSE](tags/expose.md): link/expose a port
* [USER](tags/user.md): create user
* [LABEL](tags/label.md): image metadata
* [VOLUME](tags/volume.md): create a mounting point 
<small>(such as `/mnt` for WSL)</small>

You may use

* [ONBUILD](tags/onbuild.md) 
* [STOPSIGNAL](tags/stopsignal.md) 
* [ENTRYPOINT](tags/entrypoint.md)

And these are not `commands` but may
be useful

* [Arguments](tags/args.md)
* [Directives](tags/directives.md)

<hr class="sl">

## Kubernetes

I still haven't learned how to use it, so nothing is here
for now. It seems you can use `Kubernetes` to make sure that there are always `x` instances of an image running.

<hr class="sr">

## .dockerignore

You may have files that you don't want `Docker` to copy
so you may use a `.dockerignore` using the `.ignore`
syntax

```gitignore
# any file someting.exe is ignored
*.exe
# we don't ignore a.exe
!a.exe
# exclude a directory
directory/
```

<hr class="sl">

## Real docker example 

From [hub.docker.com](https://hub.docker.com),
a bit modified (version 4.9 → 8.4) and I added comments.

```dockerfile
# image is gcc in version 8.4
FROM gcc:8.4
# copy your project in /usr/src/myapp
COPY ../../../_kmp/_archives/tools/docker /usr/src/myapp
# then we move to this folder ...
WORKDIR /usr/src/myapp
# ... in order to compile without writing /usr/src/myapp/main.c
# or /usr/src/myapp/myapp since the current folder is /usr/src/myapp/
# generate "./myapp"
RUN gcc -o myapp main.c
# when started with call our program
CMD ["./myapp"]
```

<hr class="sr">

## Sources

* <https://docs.docker.com/>
* <https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/>
* <https://github.com/docker-library/hello-world/blob/master/Dockerfile.build>
* <https://ownyourbits.com/2017/06/20/c-build-environment-in-a-docker-container/>
* <https://amytabb.com/ts/2018_07_28/>
* <https://github.com/docker/labs/blob/master/beginner/chapters/webapps.md>
* <https://github.com/imunes/vroot-linux>
* <https://github.com/docker/labs/blob/master/beginner/chapters/webapps.md>
* docker compose