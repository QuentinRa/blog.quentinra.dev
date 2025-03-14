# Docker

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)

<div class="row row-cols-lg-2"><div>

[Docker](https://www.docker.com/) allows someone to pack an operating system along with stuff on it <small>(apps, files, configurations...)</small> in something called an **image**. You can then distribute it to others.

* 🌍 Easily share applications <small>(everything is within the image)</small>
* ☕ Easier setup <small>(create an image, and deploy it for others to use)</small>
* 🚀 Uniformize the environment <small>(same environment for everyone)</small>
* 👉 Can be run everywhere <small>(Windows, Linux, macOS...)</small>
* 🔥 Docker, unlike a VM, uses the underlying host operating system resources such as the file system, the RAM, or the CPU...
* ❌ Docker may **not** support some features, according to the operating system running the docker <small>(graphical interfaces, sound...)</small>
</div><div>

The easiest way to get started is to use [Docker desktop](https://www.docker.com/products/docker-desktop/). You may only install [docker engine](https://docs.docker.com/engine/install/) which only gives access to the `docker` command.

```shell!
$ curl -fsSL "https://get.docker.com" | sh
$ docker -v # test
```

➡️ On Kali Linux, follow these [instructions](https://docs.docker.com/engine/install/debian/), and replace the codename in `/etc/apt/sources.list.d/docker.list` with a valid one.

<br>

**Useful links** 🎉

* [Documentation](https://docs.docker.com/)
* [Docker Labs](https://github.com/docker/labs)
* [hello-world image](https://github.com/docker-library/hello-world)
</div></div>

<hr class="sep-both">

## Docker images

<div class="row row-cols-lg-2"><div>

To get started, you will have to choose and download an image 🖼️. It will be the base from which you will start adding files, packages, and everything you need for your application.

**Look for images on [Docker Hub](https://hub.docker.com/).**

We usually start from an operating system such as [ubuntu](https://hub.docker.com/_/ubuntu), or we may start from an image with our tools installed, such as with [gcc](https://hub.docker.com/_/gcc) image.

#### Docker tags

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)

A **tag** is the image's name and its version. For instance, `fedora:latest` or `fedora:34`. When the version is `latest`, it's implicit, and can be omitted, so `fedora` and `fedora:latest` are the same.

Tags point to an image. You can create them: `docker tag xxx:34 xxx:latest` <small>(xxx:latest point to xxx:34)</small> or remove them `docker rmi tag`.

👉 An image can only be removed after all tags have been removed.
</div><div>

#### Docker image commands

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)

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

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)

<div class="row row-cols-lg-2"><div>

An image is static. It's built once, and never modified. From it, you can create runtime instances, called **containers** 📦. 

On a container, you can do things like creating files, adding packages, running commands... <small>(e.g. use it)</small> but these changes will be lost when the container is destroyed <small>(unless you use docker commit)</small>.

There is no limit to the number of containers created from one image.

To **create** a container <small>(entrypoint are explained in Dockerfile section)</small>:

```ps
$ docker run image_tag        # execute tag's entrypoint
$ docker run -i -t [...]      # interactive (bash...)
$ docker run -d -t [...]      # run in background
$ docker run -t [...]         # tty == connect your terminal
$ docker run [...] /bin/bash  # CMD = ["/bin/bash"]
$ docker run [...] echo xxx   # CMD = ["echo", "xxx"]
$ docker run -p hp:dp [...]   # map host port to docker port
$ docker run --rm [...]       # auto-deleted once stopped
$ docker run --entrypoint=xxx [...]  # override the entrypoint
$ docker run --name=xxx [...] # use fixed name
$ docker run --net=xxx [...]  # see networks
$ docker run -v xxx [...]     # see docker volumes
$ docker run -e "XXX=xxx" [...] # set env variable
```

➡️ Containers will stop when the entrypoint process terminates.

✨ Flags `-t` and `-i` or `-d` can be merged: `-it` or `-dt`.

✨ You can have multiple times flags: `-e`, `-v`, and `-p`.
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

To **open a terminal** on a running container

```ps
# duplicate stdin/stdout
$ docker attach container_name_or_id
# pop a new bash
$ docker exec -it container_name_or_id /bin/bash
# if you have the IP
$ ssh user@container_ip
```

To **copy** a file from or to a docker

```shell!
$ docker cp container_id:/docker/path ./local/path
$ docker cp ./local/path container_id:/docker/path
```
</div></div>

<hr class="sep-both">

## Advanced Docker Containers Internals

<div class="row row-cols-lg-2"><div>

#### Docker network

Docker containers are by default started using `--net=bridge`. It connects them to the virtual bridge `docker0` that allows each container to contact each other.

If we use `--net=host`, it means that containers share the same network configuration as the host <small>(e.g., same `ip a` output)</small>.

```ps
$ docker network ls # list
$ docker network create network_name # create a network
$ docker network inspect network_name_or_id  # list hosts
$ docker network connect bridge container_id # add to bridge
# connect or disconnect a host to/from a network
$ docker network connect network_name_or_id container_id
$ docker network disconnect network_name_or_id container_id
```

👉 Even when creating a custom network, you can still reach the host <small>(which is the gateway, `X.X.X.1`)</small> so we don't really *need* host networks.

#### Docker Volumes

Docker volumes are the same as [Dockerfile Volume](#volume) but you can choose which folder on the host is used (more convenient).

```bash!
-v /var/www              # host=/var/www docker=/var/www 
-v /var/www:/var/zzz     # host=/var/www docker=/var/zzz
-v /var/www:/var/zzz:ro  # read-only mount
-v /var/www:/var/zzz:rw  # read-write mount
```
</div><div>

#### Docker UID/GID mapping

Docker uses UID/GID mapping to ensure proper file permissions by aligning UID and GID inside the container with the corresponding ones on the host system.

For instance, let's say the docker uses a user with UID `1000` and GID `2000`. If there is a matching user/group on the host, they will be used when creating files. Otherwise, the default user will be used <small>(root...)</small>.

```ps
$ docker run -u uid:gid [...]
```

➡️ When running a container, all file permissions within the docker are set based on the running user permissions.

#### GUI applications

To run GUI applications on Linux, run `xhost +local:docker` and use:

```yaml!
# docker run -e "DISPLAY=${DISPLAY}" \
#            -v /tmp/.X11-unix:/tmp/.X11-unix --net=host [...]
    environment:
      - DISPLAY=${DISPLAY}
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix
    network_mode: host
```
</div></div>

<hr class="sep-both">

## Dockerfile

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)

<div class="row row-cols-lg-2"><div>

A `Dokerfile` <small>(no extension)</small> is a text file used to define the configuration and steps to create a docker image <small>(e.g., the blueprint to create containers)</small>.

```dockerfile!
FROM fedora:latest

RUN dnf -y upgrade && \
    # Format: dnf -y install some_packages_here && \
    # Examples:
    dnf -y install firefox nano git dnf-utils && \
    dnf -y install iputils net-tools iproute && \
    # We usually clean up to save disk space
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

```dockerfile!
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

```dockerfile!
# RUN useradd -ms /bin/bash username (add user on Linux)
# RUN net user /add username (add user on Windows)
USER username
USER username:group
```
</div></div>

<hr class="sep-both">

## Advanced Dockerfiles

<div class="row row-cols-lg-2"><div>

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

It's possible to mount a [volume](https://docs.docker.com/storage/volumes/), e.g., creating a folder on the docker whose content is linked to a folder on the host. Adding, editing, or removing files in such folder on the docker removes them on the host. 

```dockerfile!
VOLUME /my_mount  # contents are the same for every container
```

See also: `sudo ls /var/lib/docker/volumes/` and `docker volume ls`.

#### .dockerignore

You can use a `.dockerignore` [ignore file](/programming-languages/others/data/ignore.md) to prevent some files from being copied or added when using `COPY`/`ADD`.

```yaml!
# any file ending with .exe is ignored
*.exe
# we don't ignore runner.exe
!runner.exe
# ignore a directory
directory/
```
</div></div>

<hr class="sep-both">

## Build and deploy images

<div class="row row-cols-lg-2"><div>

#### Building

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)

After creating a [Dockerfile](#dockerfile), you can build your image using:

```ps
# Assuming "Dockerfile" is inside the current folder
# ex : docker build -t my_image:latest .
$ docker build -t some_tag_here .
```

<br>

#### Docker registry

A registry is a place where images are stored 🗃️. Docker Hub is a SAAS registry. It's possible to deploy a [self-hosted registry](https://docs.docker.com/registry/deploying/).

<br>

#### Docker "clean"

To remove untagged images, stopped containers and unused layers:

```shell!
$ docker system prune -f
```

👉 Use this after `docker rmi` to ensure cached layers are deleted.
</div><div>

#### Deploying

To push images to a registry server:

```ps
# assuming example.com:5000 is a registry
# and "example.com:5000/tag" is an image locally
$ docker push example.com:5000/tag
```

To rename "tag" to "example.com:5000/tag"

```shell!
$ docker tag tag:latest example.com:5000/tag:latest
```
</div></div>

<hr class="sep-both">

## Docker compose plugin

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)

<div class="row row-cols-lg-2"><div>

Docker [compose](https://docs.docker.com/compose/) wraps all arguments passed to `docker run` inside a file called `docker-compose.yml`. It's mainly aimed at services <small>(e.g. tasks with no user interaction)</small>, but it can be used with any docker image 🎊.

```shell!
$ sudo apt-get install docker-compose-plugin
$ docker compose version
Docker Compose version vX.X.X
```

💡 It's designed to manage, and run multiple containers. All usual commands are now added after `docker compose`:

* `docker compose build`: build images
* `docker compose up`: create containers and start them <small>(can use -d)</small>
* `docker compose start`: start containers
* `docker compose run xxx`: run one service <small>(can use --rm)</small>
* `docker compose stop`: stop containers
* `docker compose down`: stop, and remove containers

Useful options: `docker compose up --no-recreate --no-start`.

Useful command: `docker attach $(docker compose ps -q)`.

🍔 For most commands, you can add the service name after the command, such as `docker compose build xxx` to work on `xxx`.
</div><div>

The syntax is pretty straightforward once you're familiar with run options. Much like `docker run` commands, almost all are optional.

```yaml!
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

<details class="details-n">
<summary>Docker networking options</summary>

How to use `--net host`?

```yaml!
    ...
    network_mode: host
```

How to use `--net some_bridge`? Note that you can use `X.X.X.1` such as `172.100.0.1` inside the docker to refer to the host.

```yaml!
    ...
    networks:
      my-bridge:
        ipv4_address: 172.100.0.2

networks:
  my-bridge:
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 172.100.0.0/24

```
</details>
</div></div>

<hr class="sep-both">

## Docker Layers 🍷

[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)
[![docker_layers](../../../../cybersecurity/_badges/rootme/forensic/docker_layers.svg)](https://www.root-me.org/en/Challenges/Forensic/Docker-layers)

<div class="row row-cols-lg-2"><div>

Each docker image is composed of multiple read-only layers. They are created during the build process.

Each instruction in a [Dockerfile](#dockerfile) generates a new layer.

It allows docker to speed up each process, by only building or deploying layers that have changed.

We may also export an image to manually explore it.

```ps
$ docker image save <image_id> --output hello.tar
$ docker import output hello.tar # import to docker
$ tar xvf hello.tar              # extract and explore
```

if you don't want to export the image to explore it layers, navigate and try to make use of `/var/lib/docker/overlay2`.
</div><div>

Each layer can have multiple files such as:

* 🗺️ `<image_hash>.json`: image information
* 🔎 `manifest.json` and `repositories`: docker information
* 📦 Nested layers
  * `json`: layer information
  * `layer.tar` : recursively extract them
  * `VERSION`: layer version

By exploring these files, you can see every changes applied to a docker image from the root image up to the current image.
</div></div>

<hr class="sep-both">

## Docker Pentester Notes ☠️

[![docker_security](../../../../cybersecurity/_badges/hacktricks/linux_hardening/privilege_escalation/docker_security.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/docker-security)
[![docker_breakout](../../../../cybersecurity/_badges/hacktricks/linux_hardening/privilege_escalation/docker_security/docker_breakout.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/docker-security/docker-breakout-privilege-escalation)

<div class="row row-cols-lg-2"><div>

#### Docker — Automated Tools

A few tool may identify privilege escalation or breakout vectors:

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) <small>(AppArmor, Capabilities, Network, Exploits)</small> with `-a`/`-t`?
* [deepce](https://github.com/stealthcopter/deepce) <small>(1.3k ⭐, Enumeration + Escape)</small>
* [cdk](https://github.com/cdk-team/CDK) <small>(4.1k ⭐, Enumeration + Escape)</small>

<br>

#### Docker — Socket Privilege Escalation

[![linuxprivilegeescalation](../../../../cybersecurity/_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![introtodockerk8pdqk](../../../../cybersecurity/_badges/thm/introtodockerk8pdqk.svg)](https://tryhackme.com/room/introtodockerk8pdqk)
[![chillhack](../../../../cybersecurity/_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![marketplace](../../../../cybersecurity/_badges/thm-p/marketplace.svg)](https://tryhackme.com/r/room/marketplace)
[![docker_talk_through_me](../../../../cybersecurity/_badges/rootme/app_script/docker_talk_through_me.svg)](https://www.root-me.org/en/Challenges/App-Script/Docker-Talk-through-me)

If a user is part of the docker group, they can interact with the docker daemon without `sudo`. This can be used for [privilege escalation](/cybersecurity/red-team/s4.privesc/index.md).

```ps
$ docker images
$ docker run --privileged -v /:/hostfs <docker_image>
$ docker run --privileged -v /:/hostfs <docker_image> bash
$ docker run --privileged -v /:/hostfs <docker_image> ls
```

The associated docker server socket permissions:

```ps
$ find / -name "*.sock" -ls 2> /dev/null
srw-rw---- 1 root docker [...] /run/docker.sock
```

Explicit usage of the socket:

```ps
$ docker -H unix:///run/docker.sock images
$ docker -H unix:///run/docker.sock run --rm -d --privileged -v /:/hostfs xxx
$ docker -H unix:///run/docker.sock run --rm -d --privileged -v /:/hostfs xxx bash
$ docker -H unix:///run/docker.sock run --privileged -v /:/hostfs xxx ls
```

We may not have `docker` on the target machine, in which case, we may use a tunnel and run `docker` on our machine with `-H`.

```ps
$ ssh -L /tmp/docker.sock:/run/docker.sock [...] # docker -H unix:///tmp/docker.sock
$ socat -d -d TCP-LISTEN:2375,reuseaddr,fork UNIX-CONNECT:/var/run/docker.sock # docker -H IP:2375
```

We may interact directly with the socket too:

```ps
$ curl --unix-socket /tmp/docker.sock http://localhost/<endpoint> [...]
/images/json # GET | list images
/containers/create # POST | create a container
/containers/<cid>/start  # GET | start a container
/containers/<cid>/logs?stderr=1&stdout=1  # GET | container logs
/containers/<cid>/exec # POST | prepare to execute a command on a container (TTY=True)
/containers/<cid>/archive?path=/ # GET | create a tar.gz
/exec/<eid>/start # POST | execute the prepared command (TTY=False, Detach=False)
```

<br>

#### Docker — TCP Privilege Escalation

[![couch](../../../../cybersecurity/_badges/thm-p/couch.svg)](https://tryhackme.com/r/room/couch)
[![docker_talk_through_me](../../../../cybersecurity/_badges/rootme/app_script/docker_talk_through_me.svg)](https://www.root-me.org/en/Challenges/App-Script/Docker-Talk-through-me)

Docker can use [TCP](https://docs.docker.com/config/daemon/remote-access/) instead of a socket. It typically uses port `2375` 🐲. Refer to [docker socket notes](#docker--socket-privilege-escalation) with: `-H 127.0.0.1:2375`.

We may not have `docker` on the target machine, in which case, we may use a tunnel and run `docker` on our machine with `-H`.

```ps
$ ssh -L 2375:localhost:2375 [...] # docker -H tcp://localhost:2375
```
</div><div>

#### Docker — SUID Abuse On Mounted Folder

[![pythonplayground](../../../../cybersecurity/_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)

If you are within a container as root and you are connected to the machine running the docker without any useful privileges, you can create a SUID script on a shared mount folder, assuming there is one.

<br>

#### Docker — Credentials Harvesting

[![busqueda](../../../../cybersecurity/_badges/htb-p/busqueda.svg)](https://app.hackthebox.com/machines/Busqueda)

Docker inspect may be used to find credentials.

```ps
$ docker inspect xxx -f '{{json .Config }}' | jq
$ docker inspect xxx -f '{{json .Config.Env }}' | jq
```

You might as well dig inside layers files `[...]/overlay2/<xxx>/diff/`.

<br>

#### Docker — Container Breakout

[![unbakedpie](../../../../cybersecurity/_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)
[![catpictures](../../../../cybersecurity/_badges/thm-p/catpictures.svg)](https://tryhackme.com/r/room/catpictures)
[![docker_i_am_groot](../../../../cybersecurity/_badges/rootme/app_script/docker_i_am_groot.svg)](https://www.root-me.org/en/Challenges/App-Script/Docker-I-am-groot)
[![docker_talk_through_me](../../../../cybersecurity/_badges/rootme/app_script/docker_talk_through_me.svg)](https://www.root-me.org/en/Challenges/App-Script/Docker-Talk-through-me)
[![docker_sys_admin_docker](../../../../cybersecurity/_badges/rootme/app_script/docker_sys_admin_docker.svg)](https://www.root-me.org/en/Challenges/App-Script/Docker-Sys-Admin-s-Docker)

To identify if we are within a container:

```shell!
$ ls /.dockerenv # pretty explicit
$ ps # a small number would be weird
$ grep 'docker\|lxc' /proc/1/cgroup
```

If we are in a container as root, and we can access hard drives <small>(fdisk output is not empty)</small>, then we can mount the drive and read its files:

```ps
$ fdisk -l
$ mkdir -p /mnt/sda1 && mount /dev/sda1 /mnt/sda1
```
```ps
$ # is there some weird partition mounted?
$ mount | grep -v /proc | grep -v /sys | grep -v overlay
```

You can look for open ports using [port scanning](/cybersecurity/red-team/s2.discovery/index.md#investigate-hosts--port-scanning):

```ps
$ nc -zv IP 1-65535 # you may use pivoting tools such as chisel to access them
$ ip a # if available (check ifconfig?), find available networks
$ ping 172.17.0.1 # if available, test to access the host
$ netstat -tunlpa # if available, may be handy too
```

Look if the container was executed with dangerous capabilities:

```shell!
$ capsh --print # cap_sys_admin? etc.
$ cat /sys/kernel/security/apparmor/profiles # Not Found=>No Apparmor
```

If you have `cap_sys_admin` and AppArmor is not enabled: try [CVE-2022-0492](https://nvd.nist.gov/vuln/detail/CVE-2022-0492) <small>(release_agent PoC one or two on Hacktricks)</small>.

```shell!
$ ./cdk run mount-cgroup "<some command>"
$ ./cdk run rewrite-cgroup-devices # debugfs -w result
```

Try to find if a docker socket is present or reachable.

#### Docker Additional Notes

* Usage of cgroups to limit memory usage etc.
* Usage of seccomp to blacklist system calls
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Dockerfile

* STOPSIGNAL
* ONBUILD
* ARG

Other notes

* [Kubernetes](https://kubernetes.io)
* [linuxhandbook](https://linuxhandbook.com/tag/docker/)
* Docker nexus repository
* `/etc/docker/daemon.json`
* `sudo systemctl restart docker`
* `docker secret` and docker compose `secrets`

```text!
sudo usermod -aG docker $USER
reboot
sudo systemctl disable docker
sudo systemctl disable docker.socket
sudo systemctl stop docker
sudo systemctl stop docker.socket
sudo systemctl start docker
sudo systemctl start docker.socket
```
</div><div>

```text!
--cap-add=NET_ADMIN
--cap-add=NET_ADMIN --device=/dev/net/tun
mknod /dev/net/tun

docker swarm init
docker stack deploy -c docker-compose.yml service_name
docker stack ls
docker stack rm service_name
docker service ls
docker service logs xxx
docker service ps xxx
docker logs

localhost:5000/v2/_catalog ==> {"repositories":["xxx"]}
localhost:5000/v2/xxx/tags/list
localhost:5000/v2/xxx/manifests/latest
```
</div></div>