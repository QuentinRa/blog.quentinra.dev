# .ignore files

<div class="row row-cols-md-2"><div>

Many tools use hidden files ending with `ignore` such as:

* `.dockerignore` ([Docker](https://docs.docker.com/engine/reference/builder/#dockerignore-file))
* `.gitignore` ([Git](https://git-scm.com/docs/gitignore))
* ...

Most are sharing the same syntax based on [wildcards](/operating-systems/linux/knowledge/index.md#glob-patterns). They will "ignore" any matching file.
</div><div>

```yaml!
*                   # all files
*.exe               # all files ending with .exe
!test.exe           # not test.exe
build               # any build folder
**/build/           # any nested build folder
```
</div></div>