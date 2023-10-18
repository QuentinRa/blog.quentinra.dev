# .ignore files

<div class="row row-cols-md-2"><div>

Many tools use hidden files ending with `ignore` such as:

* `.dockerignore` ([Docker](https://docs.docker.com/engine/reference/builder/#dockerignore-file))
* `.gitignore` ([Git](https://git-scm.com/docs/gitignore))
* ...

Most share the same syntax based on [wildcards](/operating-systems/linux/_knowledge/index.md#glob-patterns). They will "ignore" any matching file.
</div><div>

```yaml!
*                   # all files
*.exe               # all files ending with .exe
!test.exe           # do not ignore "test.exe"
build/              # any build folder
/build/             # only the build inside the root
**/build/           # any nested build folder
```

➡️ A .ignore file is applied starting from the root directory, which is the directory the .ignore file is in.
</div></div>