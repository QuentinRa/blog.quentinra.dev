# COPY

> Copy a file from a source to a destination

Syntax is like

```none
COPY src1 src2 ... srcn dest
or
COPY ["src", ...,"dest"]
or
COPY --chown={user}:{group} src1 src2 ... srcn dest
```

* ``src`` : one or more source
* ``dest`` : a destination
* ``--chown={user}:{group}`` : linux-only,
  set the user and the group of the ``dest`` file

**Exemples**

```dockerfile
# copy all files in current directory so WORKDIR
# to /usr/project/
COPY . /usr/project/
```