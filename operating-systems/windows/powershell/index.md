# Powershell

<div class="row row-cols-md-2"><div>

Powershell is a program offering a shell to run commands called **cmdlets** 🦄. It abstracts .NET Common Language Runtime <small>(CLR)</small>.

The usual format of a cmdlet is `VERB-NOUN` such as `Get-help` to get some help about a cmdlet. Its linux equivalent is `man`.

```ps
PS> Get-help some_cmdlet_here
PS> Get-Help some_cmdlet_here -examples
PS> Update-Help # if help was empty, update it first
```

👉 Commands, and arguments, are **case-insensitive** <small>(e.g. `a` == `A`)</small>

👉 You can list every cmdlet with `Get-Command`

👉 Many cmdlets have an alias to a Linux command. For instance, `help` is an alias of `Get-Help`. [Refer to Wikipedia comparison](https://en.wikipedia.org/wiki/PowerShell#Comparison_of_cmdlets_with_similar_commands).
</div><div>

Powershell cmdlets output is an **object**, unlike other shell languages which output a text. It means that we can access a specific column (**property**) or calling a **method** on it, without having to call a command such as `grep`/`cut`/... as we would on Linux. 🚀

```ps
PS> Get-help | Get-member
Name   MemberType    Definition
----   ----------    ----------
xxx    Method        xxxx
[...]
xxx    Property      xxxx
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>