# Scripts (bash)

<div class="row row-cols-md-2 mt-4"><div>

Scripts are simply files with usually many Linux commands, usually written in Bash, as it is the default shell language in many Linux-based distributions. You can see scripts as programs, and you will execute them like you do with programs.

A script is usually written in a file `name.sh`, regardless of the language used in the script, but this isn't mandatory. Here, is a simple script show "Hello, World", in a file `example.sh`

```bash
#!/bin/bash

echo "Hello, World!"
```
</div><div>

1. Create a script `example.sh` <small>(or, get a script somewhere, and got to "2.")</small>

```bash
$ touch example.sh
```

2. Allow the script to be executed

```bash
$ chmod +x example.sh
```

3. Execute the script

```bash
$ ./example.sh
```
</div></div>

> **It's important to remember that scripts are just a chain of commands**

<hr class="sr">

## Basics

<div class="row row-cols-md-2 mt-4"><div>

**Variables**

You can declare a variable with `=`, without ANY SPACES.

```bash
number=5
text1=Hello
text2="Hello, World"
```

You can even store the output of a command

```bash
command_output1=`ls -la .`
command_output2=$(ls -la .)
```

</div><div>


</div></div>