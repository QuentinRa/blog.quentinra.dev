# Docker

<div class="row row-cols-md-2"><div>

[Docker](https://www.docker.com/) allows someone to pack an operating system along with stuff on it <small>(apps, files, configurations...)</small> in something called an **image**. You can then distribute it to others.

* 🌍 Easily share applications <small>(everything is within the image)</small>
* ☕ Easier setup <small>(create an image, and deploy it for others to use)</small>
* 🚀 Uniformize the environment <small>(same environment for everyone)</small>
* 👉 Can be run everywhere <small>(Windows, Linux, macOS...)</small>
* 🔥 Docker, unlike a VM, use the underlying host operating system resources such as the file system, the RAM, or the CPU...
* ❌ Docker may **not** support some features, according to the operating system running the docker <small>(graphical interfaces, sound...)</small>
</div><div>

The easiest way to get started is to use [Docker desktop](https://www.docker.com/products/docker-desktop/). You may only install [docker engine](https://docs.docker.com/engine/install/) which only give access to the `docker` command.

```shell!
$ docker -v # test
```

➡️ On Kali Linux/Parrot Sec, follow these [instructions](https://docs.docker.com/engine/install/debian/), and replace the codename in `/etc/apt/sources.list.d/docker.list` with a valid one.

<br>

**Useful links** 🎉

* [Documentation](https://docs.docker.com/)
* [Docker Labs](https://github.com/docker/labs)
* [hello-world image](https://github.com/docker-library/hello-world)
</div></div>

<hr class="sep-both">

## Docker images

<div class="row row-cols-md-2 mt-4"><div>

To get started, you will have to choose and download an image 🖼️. It will be the base from which you will start adding files, packages, and everything you need for your application.

**Look for images on [Docker Hub](https://hub.docker.com/).**

We usually start from an operating system such as [ubuntu](https://hub.docker.com/_/ubuntu), or we may start from an image with our tools installed, such as with [gcc](https://hub.docker.com/_/gcc) image.

#### Docker tags

A **tag** is the image's name and its version. For instance, `fedora:latest` or `fedora:34`. When the version is `latest`, it's implicit, and can be omitted, so `fedora` and `fedora:latest` are the same.

Tags point to an image. You can create them: `docker tag xxx:34 xxx:latest` <small>(xxx:latest point to xxx:34)</small> or remove them `docker rmi tag`.

👉 An image can only be removed when all tags were removed.
</div><div>

#### Docker image commands

To **download** an image

```ps
$ docker pull image_name         # tag = image_name:latest
$ docker pull image_name:version # tag = image_name:version
```

To **list** images

```ps
$ docker images
$ docker image ls
```

To **delete** an image

```ps
$ docker image rm image_tag_or_id
```
</div></div>

<hr class="sep-both">

## Containers

<div class="row row-cols-md-2"><div>

An image is static. It's built once, and never modified. From it, you can create runtime instances, called **containers** 📦. 

On a container, you can do things like creating files, adding packages, running commands... <small>(e.g. use it)</small> but these changes will be lost when the container is destroyed <small>(unless you use docker commit)</small>.

There is no limit to the number of containers created from one image.

To **create** a container <small>(entrypoint are explained in Dockerfile section)</small>:

```ps
$ docker run some_tag         # run the default entrypoint
$ docker run -it [...]        # interactive (bash...)
$ docker run -dt [..;]        # run in background
$ docker run [...] /bin/bash  # run entrypoint /bin/bash
$ docker run [...] echo xxx   # run entrypoint echo, CMD "xxx"
$ docker run -p dp:hp [...]   # map docker port to host port
$ docker run --rm [...]       # auto-deleted once stopped
$ docker run --entrypoint=xxx [...]  # override the entrypoint
```

➡️ Containers will stop when the entrypoint process terminates.
</div><div>

To **list** containers

```ps
$ docker container ls    # running containers 
$ docker container ls -a # all
$ docker ps              # running containers
$ docker ps -a           # all containers
```

To **start/stop** a container

```ps
$ docker start container_name_or_id
$ docker stop container_name_or_id
```

To **delete** a container

```ps
$ docker container rm container_name_or_id
```
</div></div>

<hr class="sep-both">

## Dockerfile

<div class="row row-cols-md-2"><div>

A `Dokerfile` <small>(no extension)</small> is a text file used to define the configuration and steps to create a docker image <small>(e.g., the blueprint to create containers)</small>.

```dockerfile!
FROM fedora:latest

RUN dnf -y upgrade && \
    # Format: dnf -y install some_packages_here && \
    # Examples:
    dnf -y install firefox nano git dnf-utils && \
    dnf -y install iputils net-tools iproute && \
    # Whe usually clean-up to save disk space
    dnf clean all
    # See also: apt update/upgrade/clean/install -y

ENTRYPOINT /bin/bash
```

➡️ Read [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/).

#### FROM

You will build an image based on another image.

```dockerfile!
FROM image
FROM image:version
```

#### RUN

Use `RUN` to execute a command or multiple commands.

```dockerfile!
RUN command
RUN "command1;command2;..."
RUN ["command","arg1","arg2"]
RUN command && \
    command
```

#### ENTRYPOINT

When creating a docker container, the entrypoint is the command executed by default <small>(if any)</small>. Users can overload the entrypoint.

```dockerfile!
ENTRYPOINT command
ENTRYPOINT ["/bin/sh","-c"]   # default entrypoint
# "docker run tag": execute "entrypoint"
# "docker run tag bash": execute "entrypoint bash"
```
</div><div>

#### CMD

`CMD` allows us to define default arguments passed to the entrypoint. According to the entrypoint, `CMD` may be a command.

```dockerfile
ENTRYPOINT echo
CMD command
CMD "command1;command2;..."
CMD ["Hello", "world"]
# docker run tag: echo "Hello, World"
# docker run tag args: echo args
```

#### ENV

Use `ENV` to define environment variables.

```dockerfile!
ENV MY_HOME /home
ENV MY_HOME=/home
RUN echo ${MY_HOME} $MY_HOME 
RUN echo ${MY_HOME:-value_if_not_set} ${MY_HOME:+value_if_set}
```

#### ADD/COPY

Use `ADD`/`COPY` to copy a file to the image. Use `COPY` most of the time.

```dockerfile!
ADD src dest       # ex: ADD URL /usr/project/
COPY src dest      # ex: COPY ./file /usr/project/
```

#### WORKDIR

Instead of using `cd`/..., you should use `WORKDIR` to navigate to a folder. If the destination doesn't exist, it's created.

```dockerfile!
WORKDIR /usr/project/
```

#### USER

`USER` won't create a user, but load (~`su`) the given user.

```dockerfile
# RUN useradd -ms /bin/bash username (add user on Linux)
# RUN net user /add username (add user on Windows)
USER username
USER username:group
```
</div></div>

<hr class="sep-both">

## Advanced Dockerfiles

<div class="row row-cols-md-2"><div>

#### LABEL

Set the image properties that are shown when using the command `docker image inspect image_name_or_tag`.

```dockerfile!
LABEL name="image name"
LABEL version="image version"
LABEL maintainer="maintener"
LABEL vendor="vendor"
LABEL environment=dev
LABEL description="image description"
```

#### EXPOSE

Some docker may run a webserver or something like that. To access them on your host, you need to `EXPOSE` the port or the protocol.

```dockerfile!
EXPOSE port            # ex: 8080
EXPOSE port/protocol   # ex: 80/tcp
```
</div><div>

#### VOLUME

It's possible to mount a [volume](https://docs.docker.com/storage/volumes/), e.g., creating a folder on the docker whose content is linked to a folder on the host. Adding, editing, or removing files in such folder on the docker remove them on the host. 

```dockerfile!
VOLUME /var/www          # host=/var/www docker=/var/www 
VOLUME /var/www:/var/zzz # host=/var/www docker=/var/zzz
VOLUME ["/var/www/", "/var/log:/var/volatile/log"]
```
</div></div>

<hr class="sep-both">

## Build and deploy images

<div class="row row-cols-md-2 mt-4"><div>

#### Building

After creating a [Dockerfile](#dockerfile), you can build your image using:

```ps
# Assuming "Dockerfile" is inside the current folder
# ex : docker build -t my_image:latest .
$ docker build -t some_tag_here .
```

</div><div>

#### Deploying

...
</div></div>

<hr class="sep-both">

## Docker compose plugin

<div class="row row-cols-md-2"><div>

Docker [compose](https://docs.docker.com/compose/) wraps all arguments passed to `docker run` inside a file called `docker-compose.yml`. It's mainly aimed for services <small>(e.g. tasks with no user interaction)</small>, but it can be used with any docker image 🎊.

```shell!
$ sudo apt-get install docker-compose-plugin
$ docker compose version
Docker Compose version vX.X.X
```

💡 It's designed to manage, and run multiple containers. All usual commands are now added after `docker compose`:

* `docker compose build`: build images
* `docker compose up`: create containers and start them
* `docker compose start`: start containers
* `docker compose stop`: stop containers
* `docker compose down`: stop, and remove containers

Useful options: `docker compose up --no-recreate --no-start`.
</div><div>

The syntax is pretty straightforward once you're familiar with run options. Much like `docker run` commands, almost all are optional.

```yaml
version: '3'

services:
  service_name_here:              # --name
    build: .                      # ./Dockerfile
    image: some_name:some_version # tag
    hostname: some_hostname       # --hostname
    volumes:                      # -v
      - ./content:/content
    restart: always               # --restart
    stdin_open: true              # -i
    tty: true                     # -t
```

➡️ `build` isn't associated with a `docker run` option, but since docker compose can build images, you'll have to provide it.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Dockerfile

* STOPSIGNAL
* ONBUILD
* ARG

Kubernetes

I still haven't learned how to use it, so nothing is here
for now. It seems you can use `Kubernetes` to make sure that there are always `x` instances of an image running.

.dockerignore

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

</div><div>

* instruction in uppercase, followed by their arguments
* Docker maps the container user UID/GID to the UID/GID of a local user on the host system (user namespace)
* Docker compose (plugin?): create a YAML linking to multiple DockerFile. You write each commands args directly in the YAML.

```shell!
$ docker compose run xxx
$ docker compose up -d # ???
restart: always
$ docker network create XXX
$ docker cp xxx:/docker/path ./local/path
$ docker exec -it name /bin/bash
$ docker network connect bridge xxx
$ docker ... --network=bridge
$ docker network ls
$ docker rmi tag
$ docker tag existing_tag additional_tag
```

* [linuxhandbook](https://linuxhandbook.com/tag/docker/)
* [Kubernetes](https://kubernetes.io)
* Docker nexus repository
</div></div>