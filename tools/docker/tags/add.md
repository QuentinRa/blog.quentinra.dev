# ADD

> Add a file from a source to a destination

Syntax is like

```none
ADD [--chown={user}:{group}] {src} {dest}
```

* ``src`` : can be a path or an url
* ``dest`` : a path
* ``--chown={user}:{group}`` : linux-only,
set the user and the group of the ``dest`` file