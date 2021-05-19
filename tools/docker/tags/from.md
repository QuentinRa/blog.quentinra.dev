# FROM

> Note that this is the first line
> and it's required.

Syntax is like

```none
FROM image
or
FROM image:version
or
FROM image:version as name
```

* ``image`` : image tag used as a source
* ``version`` : version of the tag, optional
* ``name`` : you can have a lot of from and give
them a name, optional
  
**Exemples**

```dockerfile
# image is gcc, version is 8.4
FROM gcc:8.4
# image is gcc, version is latest
# you should not use that
FROM gcc:lastest
```