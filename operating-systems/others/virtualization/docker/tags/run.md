# RUN

[Go back](../../../../_kmp/_archives/tools/docker#most-used-instructions)

Run a command with `command`, a command in the image's language.

```dockerfile
RUN command
# or
RUN "command1;command2;..."
# or
RUN ["command","arg1","arg2"]
```

<hr class="sl">

## Example

```dockerfile
# install a package called locales
RUN apt-get clean && apt-get update && \
    apt-get install -y locales
# run make command, if make is installed of course
RUN make
```