# Introduction

<hr class="sl">

## Dockerfile

Here is an example of a `Dockerfile`

```dockerfile
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

* [WORKDIR](tags/workdir.md): change the working directory
* [ADD](tags/add.md): add files
* [COPY](tags/copy.md): copy files
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