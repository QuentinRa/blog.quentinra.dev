# Introduction

```dockerfile
# allow the use of port 80 (=HTTP) outside
EXPOSE 80
```

* instruction in uppercase, followed by their arguments
* [EXPOSE](tags/expose.md): link/expose a port
* [ONBUILD](tags/onbuild.md) 
* [STOPSIGNAL](tags/stopsignal.md)
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