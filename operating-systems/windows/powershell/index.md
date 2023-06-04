# Powershell

<div class="row row-cols-md-2"><div>

Powershell is a program offering a shell to run commands called **cmdlets** 🦄. It abstracts .NET Common Language Runtime <small>(CLR)</small>.

The usual format of a cmdlet is `VERB-NOUN` such as `Get-help` to get some help about a cmdlet. Its linux equivalent is `man`.

```ps
PS> Get-Help some_cmdlet_here
PS> Get-Help some_cmdlet_here -Examples
PS> Update-Help # if help was empty, update it first
```

👉 Commands, and arguments, are **case-insensitive** <small>(e.g. `a` == `A`)</small>

👉 You can list every cmdlet with `Get-Command`

👉 Many cmdlets have an alias to a Linux command. For instance, `help` is an alias of `Get-Help`. [Refer to Wikipedia comparison](https://en.wikipedia.org/wiki/PowerShell#Comparison_of_cmdlets_with_similar_commands).
</div><div>

Powershell cmdlets output is an **object**, unlike other shell languages which output a text. It means that we can access a specific column (**property**) or calling a **method** on it, without having to call a command such as `grep`/`cut`/... as we would on Linux. 🚀

```ps
PS> Get-Help | Get-Member
Name   MemberType    Definition
----   ----------    ----------
xxx    Method        xxxx
[...]
xxx    Property      xxxx
PS> Get-help | Get-member -MemberType Method
PS> Get-help | Get-member -MemberType Property
```
</div></div>

<hr class="sep-both">

## Basic commands

++++++

[**Get-ChildItem** - list files]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: list files in a directory

**Alias** 💎: `ls`

**Example** 🔥:

```ps
PS> Get-ChildItem # current
PS> Get-Childitem "C:/" # give a folder
PS> Get-Childitem -Path "C:/" # same
```

Only keep files matching a [glob-pattern](/operating-systems/linux/knowledge/index.md#glob-patterns):

```ps
PS> Get-Childitem [...] -Filter "a*"
PS> Get-Childitem [...] -Include "a*" # ~same
```
</div><div>

Only show files or folders:

```ps
PS> Get-Childitem [...] -File
PS> Get-Childitem [...] -Directory
```

You can list files recursively:

```ps
PS> Get-Childitem [...] -r
PS> Get-Childitem [...] -Recurse
```
</div></div>

[**Set-Location** - go to folder]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: change your working directory

**Alias** 💎: `cd`

**Example** 🔥:

```ps
PS> Set-Location # DO NOTHING
PS> Set-Location "C:/" # Go to folder
PS> Set-Location -Path "C:/" # Go to folder
```
</div><div>
</div></div>

[**Get-Location** - get pwd]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: get the path to your working directory

**Alias** 💎: `pwd`

**Example** 🔥:

```ps
PS> Get-Location
```
</div></div>

[**Get-Content** - display file]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: reads and outputs the content of a file

**Alias** 💎: `cat`

**Example** 🔥:

```ps
PS> Get-Content file.txt
PS> Get-Content -Path file.txt
```
</div></div>

++++++

<hr class="sep-both">

## Output manipulation

++++++

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

++++++

<hr class="sep-both">

## Text utilities

++++++

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

++++++

<hr class="sep-both">

## Network utilities

++++++

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

++++++

<hr class="sep-both">

## System utilities

++++++

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

[**xxx** - xxx]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: xxx

**Alias** 💎: `xxx`

**Example** 🔥:

```ps
PS> 
```
</div><div>
</div></div>

++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>