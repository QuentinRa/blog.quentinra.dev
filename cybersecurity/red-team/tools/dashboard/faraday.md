# Faraday

<div class="row row-cols-md-2"><div>

[Faraday](https://faradaysec.com/) is a platform to facilitate security assessments, by providing a dashboard interfacing the results of many cybersecurity tools.

* [Documentation](https://docs.faradaysec.com/) (⛪)
* [Open-source](https://github.com/infobyte/faraday/) (4.2k ⭐) with a paid-plan
* [Supported tools](https://docs.faradaysec.com/import/#supported-file-formats) <small>(nmap, metasploit, ping, ZAP, W3af, Nessus...)</small>

Supported tools are [plugins](https://github.com/infobyte/faraday_plugins) in [Python](/programming-languages/high-level/python/index.md). It's quite easy to write your own. The [plugin development](https://docs.faradaysec.com/Basic-plugin-development/) section is a good start.

After installing faraday, you can access it at `http://localhost:5985/`.
</div><div>

**Terminology** 📚

* A **workspace** 🏠 is a separate dashboard usually associated with one security assessment.
* A **host** 🧑 is a device, such as a computer, that was detected, and may contain vulnerabilities. 
* A host may have **services** 🏭 running such as HTTPS/443.
* A host may have **vulnerabilities** 🧨 which are either created manually or imported from a file or a command.

See also: [Faraday CLI](https://github.com/infobyte/faraday-cli).
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

**Plugins can only create vulnerabilities**. A new vulnerability is created after each import, unless there is already a vulnerability that is the exact same <small>(e.g., all attributes have the same value)</small>. 

👉 There is one exception: if a vulnerability was marked as "closed," it becomes "re-opened" if re-imported in a scan.
</div><div>

By default, for file report plugins, the name and type of file determine which plugin will parse it. Only `.xml`, `.txt`, and `.zip` extensions are <small>(currently)</small> allowed. To by-pass this, rename your report file to match this regex: `.*_faraday_plugin_name.*` as it's the first element used to [determines](https://github.com/infobyte/faraday_plugins/blob/master/faraday_plugins/plugins/manager.py#L42) which plugin is loaded.

#### Basic templates

Here are some empty templates to get started:

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
        # read the code of others plugins to 
        # write your parser
        pass


def createPlugin(*args, **kwargs):
    return XXXClass(*args, **kwargs)

```
</details>

<details class="details-n">
<summary><code>test.py</code>: template to test your parser</summary>

While there are tools to [easily test your plugin](https://github.com/infobyte/faraday_plugins/tree/master#commands), to test your parser, you may use this sample script:

```py
# assuming we are in a plugin's folder
from pathlib import Path
# ./plugin.py contains "XXXClass"
from plugin import XXXClass

with Path('my_test_file.txt').open(**{"mode": "rb"}) as f:
	plugin = XXXClass()
	plugin.parseOutputString(f.read())
```
</details>

#### Faraday commands

Inside your script, using the data you got from parsing a file or a command, you'll call them methods:

```ini!
# create a host, e.g., a target having vulnerabilities
host_id = createAndAddHost(...)
# create a host, and add a service to it (ex: HTTP/80)
service_id = createAndAddServiceToHost(...)
# add a vulnerability to...
vuln_id = createAndAddVulnToHost(...)       # a host
vuln_id = createAndAddVulnToService(...)    # a service
vuln_id = createAndAddVulnWebToService(...) # a web service
```
</div></div>

<hr class="sep-both">

## Faraday API

<div class="row row-cols-md-2"><div>

Faraday API is documented in their [OpenAPI](https://docs.faradaysec.com/api-swagger/) specification, along inside the [API Server Page](https://docs.faradaysec.com/API-Server/), but some routes are missing.

Assuming the following Python script:

```py
from requests import Session

username=''
password=''
server_address=''
workspace_name=''
headers={'Content-Type': 'application/json'}

print('Authentication to server {0}'.format(server_address))
session = Session()
```

* Login

```py
response = session.post(server_address + '/_api/login', json={'email': username, 'password': password})
# status_code == 200 
```

* Get all vulnerabilities in a workspace

```py
response = session.get(server_address + f'/_api/v3/ws/{workspace_name}/vulns', headers=headers)
result = response.json()
# status_code == 200
```
</div><div>

* Delete a vulnerability by ID

```py
vuln_id = ''
response = session.delete(server_address + f'/_api/v3/ws/{workspace_name}/vulns/{vuln_id}')
# status_code == 204
```

* Update a vulnerability

```py
vuln_value = {} # fetch the vulnerability first
response = session.put(server_address + f'/_api/v3/ws/{workspace_name}/vulns/{vuln_id}', json=vuln_value)
# status_code == 200
```

* Upload a report

```py
response = session.get(server_address + f'/_api/session', headers=headers)
token = response.json()['csrf_token']
# status_code == 200

files = {'file': open('xxx','rb')}
values = {'csrf_token': token}
response = session.post(server_address + f'/_api/v3/ws/{workspace_name}/upload_report', files=files, data=values)
# status_code == 200
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* internal API URL
</div><div>
</div></div>