# COPY

[Go back](../../../../_kmp/_archives/tools/docker#most-used-instructions)

Copy a file from a source to a destination with

* `src`: one or more sources
* `dest`: a destination (folder)
* `--chown={user}:{group}`: Linux-only, set the user and the group of the `dest` file

```dockerfile
COPY src1 src2 ... srcn dest
# or
COPY ["src", ...,"dest"]
# or
COPY --chown={user}:{group} src1 src2 ... srcn dest
```

<hr class="sl">

## Example

```dockerfile
# copy all files in current directory so WORKDIR
# to /usr/project/
COPY . /usr/project/
```