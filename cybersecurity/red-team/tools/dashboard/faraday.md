# Faraday

<div class="row row-cols-md-2"><div>

[Faraday](https://faradaysec.com/) is a platform to facilitate security assessments, by providing a dashboard interfacing the results of many cybersecurity tools.

* [Documentation](https://docs.faradaysec.com/) (⛪)
* [Open-source](https://github.com/infobyte/faraday/) (4.2k ⭐) with a paid-plan
* [Supported tools](https://docs.faradaysec.com/import/#supported-file-formats) <small>(nmap, metasploit, ping, ZAP, W3af, Nessus...)</small>

Supported tools are [plugins](https://github.com/infobyte/faraday_plugins) in [Python](/programming-languages/high-level/python/index.md). It's quite easy to write your own. The [plugin development](https://docs.faradaysec.com/Basic-plugin-development/) section is a good start.
</div><div>

You can install faraday using [Docker Compose](/operating-systems/others/virtualization/docker/index.md#docker-compose-plugin):

```shell!
$ mkdir faraday && cd faraday
$ wget https://raw.githubusercontent.com/infobyte/faraday/master/docker-compose.yaml -O docker-compose.yml
$ docker compose up
[...]
Admin user created with username: faraday password: password
```

You can access faraday at `http://localhost:5985/`.
</div></div>