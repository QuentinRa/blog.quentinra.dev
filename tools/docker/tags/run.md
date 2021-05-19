# RUN

> Run a command

Syntax is like

```none
RUN command
or
RUN "command1;command2;..."
or
RUN ["command","arg1","arg2"]
```

* ``command`` : a command, is the os-image-specific
language

**Exemples**

```dockerfile
# install a package called locales
RUN apt-get clean && apt-get update && \
    apt-get install -y locales
# run make command, if installed of course
RUN make
```