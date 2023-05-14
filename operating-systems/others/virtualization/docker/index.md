# Docker

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```shell!
$ docker -v
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
* Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
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