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

## Plugins development

<div class="row row-cols-md-2"><div>

Faraday will look for plugins inside its default plugin folder, and inside the **Custom Plugin Folder** (CPF). 

You first need to change its value, which is stored inside the database. You only have to do it once.

```shell!
$ faraday-manage settings -a update reports --data '{"custom_plugins_folder": "/home/faraday/.faraday/faraday_plugins/"}'
```

➡️ Use `faraday-manage settings -a show reports` to check its value.

➡️ The command assumes that `~/.faraday/faraday_plugins` will be used to store your custom plugins <small>(same folder on host and docker)</small>.

<br>

#### Basics

Each plugin has its own folder with an empty `__init__.py` and a `plugin.py` file. To develop on the host, you need to install:

```shell!
$ pip install faraday-plugins
```

There are two types of plugins, while one plugin can have both:

* `command`: a plugin parsing a command output
* `file`: a plugin parsing a file report
</div><div>

#### Notes

<details class="details-n">
<summary><code>plugin.py</code>: file plugin template</summary>

```py
from faraday_plugins.plugins.plugin import PluginBase


class XXXClass(PluginBase):
    def __init__(self, *arg, **kwargs):
        super().__init__(*arg, **kwargs)
        self.id = "xxx"
        self.name = "xxx"
        self.plugin_version = "0.0.1"
        self.version = "0.0.1"

    # output is a string with all lines of the files
    # you need to parse them
    def parseOutputString(self, output):
        pass


def createPlugin(*args, **kwargs):
    return XXXClass(*args, **kwargs)

```
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>
</div><div>
</div></div>