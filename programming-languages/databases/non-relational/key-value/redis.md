# Redis

<div class="row row-cols-md-2"><div>

**Redis** is an in-memory key-value database. See also: [NoSQL](../index.md).

```shell!
$ sudo apt install redis-tools
```

By default, it runs on port `6379` 🐲.

* [Documentation](https://redis.io/docs/getting-started/)
* [Commands](https://redis.io/commands/)
</div><div>

```shell!
$ redis-cli [-h host] [-p port]
host:port> help             # list commands
host:port> info             # get information
host:port> keys *           # list keys
host:port> get some_key     # get some value
host:port> set key value    # set some value
host:port> del key          # delete a key
```
</div></div>