# expect

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

#### Basic Usage

We can use `spawn` to start a process:

```tcl
spawn some_command
spawn ./some_script
```

We pass to `expect` the text we are waiting for. 

```tcl
expect "login: "
expect -exact "login: "
expect eof
```

And then we define what text we are injecting:

```tcl
send "username\r"
send -- "username\r"
```

⚠️ The process is only started when we call `send`. The process is terminated if there is no more `expect`.

➡️ Use `interact` to execute manual tasks.
</div><div>

#### Variables

You can define variables using `set`:

```tcl
set varname varvalue
spawn echo "$varname"
```

#### Multiple processes

When a process is started, the `$spawn_id` variable is set. It is used by the following `expect` or `send` calls to determine which process they are working on. We can set it manually.

```tcl
# current=processA
spawn processA            
set processA_id $spawn_id
spawn processB
# current=processB
set processB_id $spawn_id
# current=processA
set spawn_id $processB_id
```

#### Import Script

You can use `source` to import another script:

```tcl
source ./xxx.exp
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `autoexpect my_script`
</div><div>
</div></div>