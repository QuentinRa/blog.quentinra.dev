# Select an exploit - msfconsole

[Go back](../index.md#msfconsole)

<div class="row row-cols-lg-2"><div>

#### Command: use

On you determined the exploit you want to test out, you need to select it, in order to configure it.

If you first [searched](msf_search.md) results, you can use:

```shell!
msf6> use module_name # ex: exploit/xxx/...
msf6> use module_index # ex: 0
```

The command may also work if you didn't search a module, but only if the identifier you give to use is only matching one module.

```shell!
msf6> use ms17_010_eternalblue
```

Searching this module only returns one result, so we don't have to write the full module name.
</div><div>

#### Command: back

If you don't want to use a module anymore, you can go back to "no module selected" without having to close Metasploit using `back`.

```shell!
msf6 exploit('module_used')> back
msf6> # you're back
```
</div></div>