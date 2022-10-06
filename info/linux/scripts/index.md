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
$ bash < ./example.sh # or, in rare cases
```
</div></div>

> **It's important to remember that scripts are just a chain of commands**

<hr class="sl">

## POSIX standard

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

The Portable Operating System Interface (**POSIX**) is a family of standards (`normes POSIX`) that defines what we should, and shouldn't do, to make our apps compatibles across a maximum of operating systems.

**DO only use allowed POSIX syntax in your scripts.**
</div><div>

❌ DO NOT USE `((`, `[[`, `]]`, and `))`

```bash
for (( i = 0; i < 10; i++ )); do
    # code
done

echo $((0+1))

if [[ 5 > 3 ]]; then
  # code
fi
```
</div></div>

<hr class="sr">

## Introduction

<div class="row row-cols-md-2 mt-2"><div>

Every script **should** start with a directive telling the shell in which language the script is. It is mostly a link to the interpreter.

* Traditional way for a script (bash)

```bash
#!/bin/bash
```

* Best way for a script (bash)

```bash
#!/usr/bin/env bash
```
</div><div class="align-self-center">

It's important for you to remember that in shell, **0 means success**, anything else, usually 1, means failure. This will be important later, because in conditions

* **0 means TRUE**
* **NOT 0 means FALSE**

This MUST be engraved in your mind, because in many other languages, such as C, `if (1)` is TRUE, while in bash, `if (1)` is FALSE. 

</div></div>