# RUN

[Go back](..#most-used-instructions)

Run a command

```dockerfile
RUN command
# or
RUN "command1;command2;..."
# or
RUN ["command","arg1","arg2"]
```

with ``command``, a command in the os-image-specific
language.

<hr class="sl">

## Example

```dockerfile
# install a package called locales
RUN apt-get clean && apt-get update && \
    apt-get install -y locales
# run make command, if make is installed of course
RUN make
```