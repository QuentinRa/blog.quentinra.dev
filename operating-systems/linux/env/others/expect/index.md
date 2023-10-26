# expect

<div class="row row-cols-md-2"><div>

[expect](https://linux.die.net/man/1/expect) is an automation tool for automating interactive tasks. 🤖. For instance, we could automatically enter credentials to a command.

```shell!
$ sudo apt-get install expect
```
</div><div>

We often create a `.exp` file with all commands:

```ps
$ cat myscript.exp
#!/usr/local/bin/expect -f

...
$ ./myscript.exp
```
</div></div>