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