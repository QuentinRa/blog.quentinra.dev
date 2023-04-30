# USER

[Go back](../../../../_kmp/_archives/tools/docker#most-used-instructions)

Create a user with `name` the username.

```dockerfile
USER name
```

**Beware**: On Windows, you must call `RUN net user /add name` or it will fail.