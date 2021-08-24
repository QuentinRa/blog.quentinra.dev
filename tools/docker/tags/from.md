# FROM

[Go back](..#most-used-instructions)

This is the first line of your Dockerfile and it's required. You may have multiples of them if you are making multiples builds

```dockerfile
FROM image
# or
FROM image:version
# or
FROM image:version as name
```

* ``image``: image tag used as a source
* ``version``: version of the tag, optional
* ``name``: you can have a lot of from and give them a name, optional

<hr class="sl">
  
## Example

```dockerfile
# image is gcc, version is 8.4
FROM gcc:8.4
# image is gcc, version is latest
# you should not use latest
FROM gcc:latest
```