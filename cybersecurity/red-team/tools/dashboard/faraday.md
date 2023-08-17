# Faraday

<div class="row row-cols-md-2"><div>

[Faraday](https://faradaysec.com/) is a platform to facilitate security assessments, by providing a dashboard interfacing the results of many cybersecurity tools.

* [Documentation](https://docs.faradaysec.com/) (⛪)
* [Open-source](https://github.com/infobyte/faraday/) (4.2k ⭐) with a paid-plan
* [Supported tools](https://docs.faradaysec.com/import/#supported-file-formats) <small>(nmap, metasploit, ping, ZAP, W3af, Nessus...)</small>

Supported tools are [plugins](https://github.com/infobyte/faraday_plugins) in [Python](/programming-languages/high-level/python/index.md). It's quite easy to write your own. The [plugin development](https://docs.faradaysec.com/Basic-plugin-development/) section is a good start.

After installing faraday, you can access it at `http://localhost:5985/`.
</div><div>

➡️ Use `docker compose down` to shut down all services.
</div></div>

<hr class="sep-both">

## Install and configure Faraday

<div class="row row-cols-md-2"><div>

You can install faraday using [Docker Compose](/operating-systems/others/virtualization/docker/index.md#docker-compose-plugin):

```shell!
$ mkdir faraday && cd faraday
$ wget https://raw.githubusercontent.com/infobyte/faraday/master/docker-compose.yaml -O docker-compose.yml
$ docker compose up -d
[...]
Admin user created with username: faraday password: password
```

To access `faraday-*` binaries, connect to the docker:

```shell!
$ docker exec -it $(docker compose ps -q app) /bin/bash
```

To shut down all services, use:

```shell!
$ docker compose stop
```
</div><div>

#### Run as a service

When running as a service, faraday will always be running, and you won't have to start/stop/restart it.

Assuming you did the previous commands, do:

```shell!
$ docker compose down
$ docker swarm init
$ docker stack deploy -c docker-compose.yml faraday
```

➡️ You should use `docker secrets` instead of plaintext passwords inside the `docker-compose.yml`.

#### Configuration

By default, configuration files and logs are stored inside `~/.faraday`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>
</div><div>
</div></div>