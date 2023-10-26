# expect

<div class="row row-cols-md-2"><div>

[expect](https://linux.die.net/man/1/expect) is an automation tool for automating interactive tasks. 🤖. For instance, we could automatically enter credentials to a command.

```shell!
$ sudo apt-get install expect
```

We will define a text/pattern that we are expecting <small>(ex: "login: ")</small>. We it is found, we will determine which text to send.
</div><div>

We often create a `.exp` file with all commands:

```ps
$ cat myscript.exp
#!/usr/local/bin/expect -f

...
$ ./myscript.exp
```
</div></div>

<hr class="sep-both">

## Expect Basics

<div class="row row-cols-md-2"><div>

#### Basic Usage

We can use `spawn` to start a process:

```bash!
spawn some_command
spawn ./some_script
```

We pass to `expect` the text we are waiting for. 

```bash!
expect "login: "
expect -exact "login: "
expect eof
```

And then we define what text we are injecting:

```bash!
send "username\r"
send -- "username\r"
```

⚠️ The process is only started when we call `send`. The process is terminated if there is no more `expect`.
</div><div>
</div></div>