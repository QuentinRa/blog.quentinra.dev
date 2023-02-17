# ADD

[Go back](..#most-used-instructions)

Add a file from a source to a destination with

* `src`: can be a path or a URL
* `dest`: a path
* `--chown={user}:{group}`: Linux-only, set the user and the group of the `dest` file

```dockerfile
ADD src dest
# or
ADD --chown=user:group src dest
```