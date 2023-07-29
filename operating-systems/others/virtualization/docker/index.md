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
$ docker run -it some_tag     # interactive (bash...)
$ docker run -dt some_tag     # run in background
$ docker run [...] /bin/bash  # run entrypoint /bin/bash
$ docker run [...] echo xxx   # run entrypoint echo, CMD "xxx"
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

A `Dokerfile` <small>(no extension)</small> is a file describing what to do to create the image you want.

```dockerfile!
FROM fedora:latest

RUN dnf -y upgrade && \
    # Format: dnf -y install some_packages_here && \
    # Examples:
    dnf -y install firefox nano git dnf-utils && \
    dnf -y install iputils net-tools iproute && \
    dnf clean all

ENTRYPOINT /bin/bash
```

</div><div>

...
</div></div>

<hr class="sep-both">

## Build, and deploy images

<div class="row row-cols-md-2 mt-4"><div>

#### Building

You can configure and tune an image by creating a file called `Dokerfile`. Once finished, you can build your image using:

```bash!
# Assuming "Dockerfile" is inside the current folder
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

```shell!
$ docker network create XXX
$ docker cp xxx:/docker/path ./local/path
$ docker exec -it name /bin/bash
$ docker network connect bridge xxx
$ docker ... --network=bridge
$ docker network ls
$ docker rmi tag
$ docker tag existing_tag additional_tag
```
</div><div>

* [old](_old.md)
* Docker maps the container user UID/GID to the UID/GID of a local user on the host system (user namespace)
* Docker compose (plugin?): create a YAML linking to multiple DockerFile. You write each commands args directly in the YAML.

```shell!
$ docker compose run xxx
$ docker compose up -d # ???
restart: always
```

* [linuxhandbook](https://linuxhandbook.com/tag/docker/)
* [Kubernetes](https://kubernetes.io)
* Docker nexus repository
</div></div>