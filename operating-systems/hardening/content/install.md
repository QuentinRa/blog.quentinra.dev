# Fedora docker setup

<div class="row row-cols-md-2"><div>

Assuming you have installed [docker](/operating-systems/others/virtualization/docker/index.md) and [docker compose](/operating-systems/others/virtualization/docker/index.md#docker-compose-plugin), you can easily install `ComplianceAsCode/content` on a Fedora docker as follows:

1. Create a folder to store your files, and move into it

```shell!
$ mkdir openscap && cd openscap
```

2. Create a Dockerfile <small>(based on [the build dockerfile](https://github.com/ComplianceAsCode/content/blob/master/Dockerfiles/fedora))</small>

```dockerfile!
FROM fedora:latest

RUN dnf -y upgrade && \
    dnf -y install cmake ninja-build openscap-utils python3-jinja2 python3-PyYAML && \
    dnf clean all

ENTRYPOINT /bin/bash
```

2. Create `docker-compose.yml`

```yaml!
version: '3'

services:
  openscap:
    build: .
    image: fedora-openscap:1.00
    hostname: openscap
    volumes:
      - ./content:/content
    restart: always
    stdin_open: true
    tty: true
```
</div><div>

3. Clone the [GitHub](https://github.com/ComplianceAsCode/content) repository

```shell!
$ git clone https://github.com/ComplianceAsCode/content.git
```

4. Build the docker image

```shell!
$ docker compose build
```

5. Run the docker image

```shell!
$ docker compose up --no-recreate --no-start
$ docker compose start
$ docker ps
CONTAINER ID   IMAGE [...]
000000c0b00e   fedora-openscap:1.00 [...]
$ docker attach 000000c0b00e
```

6. Build some product to test if it works

```shell!
$ cd /content
$ ./build_product debian11 # example
```
</div></div>