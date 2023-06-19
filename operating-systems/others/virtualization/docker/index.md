# Docker

<div class="row row-cols-md-2"><div>

[Docker](https://www.docker.com/) allows someone to pack an operating system along with stuff on it <small>(apps, files, configurations...)</small> in something called an **image**. You can then distribute it to others.

* 🌍 Easily share applications <small>(get a container, run it, and you're done)</small>
* ☕ Easy development setup <small>(someone installs, and deploys it to others)</small>
* 🚀 Uniformize the environment <small>(same environment for everyone)</small>
* 👉 Can be run everywhere <small>(Windows, Linux, macOS...)</small>
* 🔥 Docker, unlike a VM, use the underlying host operating system resources such as the file system, the RAM, or the CPU...
* ❌ May not support some features, according to the operating system running the docker <small>(graphical interfaces, sound...)</small>

The easiest way to get started is to use [Docker desktop](https://www.docker.com/products/docker-desktop/). You may only install [docker engine](https://docs.docker.com/engine/install/) which only give access to the `docker` command.

```shell!
$ docker -v # test
```
</div><div>

To get started, you will have to pick and download an image 🖼️. It will be the base from which you will start adding files, packages, and everything you need for your application.

👉 Browse images on [Docker Hub](https://hub.docker.com/)

We usually start from an operating system such as [ubuntu](https://hub.docker.com/_/ubuntu), or we may start from an image with our tools installed, such as with [gcc](https://hub.docker.com/_/gcc) image.

➡️ If you are using WSL, you might check out [Pengwin](https://github.com/WhitewaterFoundry/Pengwin) <small>(wlinux)</small>.

To download an image locally, use:

```ps
$ docker pull image_name
$ docker pull image_name:version
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```shell!
$ docker network create XXX
$ docker pull XXX:version
$ docker cp xxx:/docker/path ./local/path
$ docker image ls -a
$ docker image rm iid
$ docker container ps -a
$ docker container ls -la
$ docker container rm cid
$ docker start cid
$ docker exec -it name /bin/bash
$ docker stop cid
```
</div><div>

* [old](_old.md)
* Docker maps the container user UID/GID to the UID/GID of a local user on the host system (user namespace)
* Docker compose (plugin?): create a YAML linking to multiple DockerFile. You write each commands args directly in the YAML.

```shell!
$ docker compose run xxx
$ docker compose up -d # ???
```

* Unused

```shell!
$ docker network connect bridge xxx
$ docker ... --network=bridge
$ docker network ls
$ docker network inspect bridge
```
</div></div>