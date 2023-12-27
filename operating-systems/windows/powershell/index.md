# Powershell

[![powershell](../../../cybersecurity/_badges/thmp/powershell.svg)](https://tryhackme.com/room/powershell)
[![windowsfundamentals](../../../cybersecurity/_badges/htb/windowsfundamentals.svg)](https://academy.hackthebox.com/course/preview/windows-fundamentals)

<div class="row row-cols-lg-2"><div>

Powershell is a program offering a shell to run commands called **cmdlets** 🦄. It abstracts .NET Common Language Runtime <small>(CLR)</small>.

The usual format of a cmdlet is `VERB-NOUN` such as `Get-help` to get some help about a cmdlet. Its linux equivalent is `man`.

```ps
PS> Get-Help some_cmdlet_here
PS> Get-Help some_cmdlet_here -Examples
PS> Update-Help # if help was empty, update it first
```

👉 Commands, and arguments, are **case-insensitive** <small>(e.g. `a` == `A`)</small>

👉 You can list every cmdlet with `Get-Command` (`gcm`).

👉 Many cmdlets have an alias for a Linux command. For instance, `help` for `Get-Help`. See `Get-Alias` or [refer to Wikipedia comparison](https://en.wikipedia.org/wiki/PowerShell#Comparison_of_cmdlets_with_similar_commands).
</div><div>

Powershell cmdlets output an **object**, unlike other shell languages, which output plaintext. It means that we can access a specific column (**property**) or call a **method** on it without having to call a command such as `grep`/`cut`/... as we would on Linux. 🚀

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

👉 Use <kbd>TAB</kbd> to iterate through arguments.
</div></div>

<hr class="sep-both">

## Basic Overview

<div class="row row-cols-lg-2"><div>

#### Execute a script

For a normal `.ps1` script, use dot sourcing:

```ps
PS> . .\MyScript.ps1
```

For a PSI module (`.psm1`), import the module:

```ps
PS> Import-Module .\MyModule.psm1
```

#### Powershell ISE

The PowerShell ISE (Integrated Scripting Environment) is an editor for writing, testing, and debugging PowerShell scripts.
</div><div>

#### Execution Policy

Normal users can't execute scripts by default. There are a few configurations that may be selected. They can be easily by-passed by typing the script contents directly into the shell.

* `AllSigned`: allow signed scripts to be executed
* `Bypass`: no restrictions ☠️ and no warnings
* `Default`: use the default policy (`Restricted`)
* `RemoteSigned`: downloaded scripts must be signed to be executed
* `Restricted`: cannot run scripts, only commands
* `Undefined`: no policy
* `Unrestricted`: no restrictions ️☠️ | warning for remote scripts ⚠️

```ps
PS> Get-ExecutionPolicy -List
PS> Set-ExecutionPolicy Bypass -Scope Process
PS> Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```
</div></div>

<hr class="sep-both">

## Basic commands

++++++

[**Get-ChildItem** - list files]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: list files in a directory

**Alias** 💎: `ls`

**Example** 🔥:

```ps
PS> Get-ChildItem # current
PS> Get-Childitem "C:/" # give a folder
PS> Get-Childitem -Path "C:/" # same
```

Only keep files matching a [glob-pattern](/operating-systems/linux/_knowledge/index.md#glob-patterns):

```ps
PS> Get-ChildItem [...] -Filter "a*"
PS> Get-ChildItem [...] -Include "a*" # ~same
```
</div><div>

Only show files or folders:

```ps
PS> Get-ChildItem [...] -File
PS> Get-ChildItem [...] -Directory
```

You can list files recursively:

```ps
PS> Get-ChildItem [...] -r
PS> Get-ChildItem [...] -Recurse
```
</div></div>

[**Set-Location** - go to folder]

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: get the path to your working directory

**Alias** 💎: `pwd`

**Example** 🔥:

```ps
PS> Get-Location
```
</div></div>

[**Get-Content** - display file]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: reads and outputs the content of a file

**Aliases** 💎: `cat`, `gc`

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

[**Select-Object** - create object]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: create an object; can be used to create an object with fewer properties than another object.

**Alias** 💎: `N/A`

**Example** 🔥:

Only keep the properties "A" and "B" from the previous object output.

```ps
PS> [...] | Select-Object -Property A, B
```
</div><div>
</div></div>

[**Where-Object** - filter lines]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: only keep objects matching the conditions.

**Alias** 💎: `N/A`

**Example** 🔥:

```ps
PS> XXX | Where-Object -Property XXX -eq YYY
```
</div><div>
</div></div>

[**Sort-Object** - sort lines]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: sort lines based on one or more properties.

**Alias** 💎: `sort`

**Example** 🔥:

```ps
PS> [...] | Sort-Object SomeProperty
PS> [...] | Sort-Object SomeProperty,SomeProperty
```
</div><div>
</div></div>

++++++

<hr class="sep-both">

## Text utilities

++++++

[**Measure-Object** - count of...]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: number of words/lines/...

**Alias** 💎: `<None>`

**Example** 🔥:

```ps
PS> [...] | Measure-Object
PS> [...] | Measure-Object -Word
PS> [...] | Measure-Object -Line
PS> [...] | Measure-Object -Character
```
</div><div>
</div></div>

[**Select-String** - grep lines]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: only keep lines matching a pattern

**Alias** 💎: `<None>`

**Example** 🔥:

```ps
PS> [...] | Select-String "xxx"
PS> [...] | Select-String -Pattern "xxx"
PS> Select-String [...] -Path "xxx"
```
</div><div>
</div></div>

++++++

<hr class="sep-both">

## Network utilities

++++++

[**Invoke-WebRequest** - http request]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: download a file from a URL

**Aliases** 💎: `wget`/`curl`/`iwr`

**Example** 🔥:

```ps
PS> Invoke-WebRequest URL
PS> Invoke-WebRequest -uri URL
```

You can save the output somewhere else:

```ps
PS> Invoke-WebRequest [...] -o output
PS> Invoke-WebRequest [...] -outfile output
```
</div><div>
</div></div>

[**Get-NetIPAddress** - list interfaces]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: list network interfaces. Similar to Linux `ip a`.

**Alias** 💎: `<None>`

**Example** 🔥:

```ps
PS> Get-NetIPAddress
```
</div><div>
</div></div>

[**Get-NetTCPConnection** - list open ports]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: list open ports. Similar to Linux `netstat`.

**Alias** 💎: `<None>`

**Example** 🔥:

```ps
PS> Get-NetTCPConnection
```
</div><div>
</div></div>

++++++

<hr class="sep-both">

## Management utilities

<div class="row row-cols-lg-2"><div>

The commands are alternatives to the wmic commands:

* Operating System Information

```ps
PS> Get-CimInstance -ClassName Win32_OperatingSystem
PS> Get-WmiObject -Class Win32_OperatingSystem
```

* Installed Programs

```ps
PS> Get-WmiObject -Class Win32_Product
```

* Apps run at startup

```ps
PS> Get-CimInstance -ClassName Win32_StartupCommand
```
</div><div>

* User Information

```ps
PS> Get-LocalUser
```

* List processes/services

```ps
PS> Get-WmiObject -Class Win32_Service
PS> Get-WmiObject -Class Win32_Process
PS> Get-Process
```

* BIOS information

```ps
PS> Get-WmiObject -Class Win32_Bios
```
</div></div>

<hr class="sep-both">

## System utilities

++++++

[**Test-Path** - test if path exists]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: test if a given path exists.

**Alias** 💎: `<None>`

**Example** 🔥:

```ps
PS> Test-Path "C:/"
PS> Test-Path -Path "C:/"
```
</div><div>
</div></div>

[**Get-FileHash** - file hash]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: get a file hash

**Alias** 💎: `<None>`

**Example** 🔥:

```powershell
PS> Get-FileHash file
PS> Get-FileHash [...] -Algorithm xxx
```
</div><div>
</div></div>

[**Get-HotFix** - list hotfixes]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: list hot fixes

**Alias** 💎: `<None>`

**Example** 🔥:

```powershell
PS> Get-HotFix
```
</div></div>

[***-Service** - services]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: you can manipulate services using these.

**Example** 🔥:

```powershell
PS> Get-Service -name spooler # status
PS> Stop-Service -name spooler # stop
PS> Start-Service -name spooler  # start
```
</div></div>

++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```ps
PS> Set-WinUserLanguageList -LanguageList  fr-FR, en-US -force
PS> $Env:path = "$Env:path;${pwd}\bin"
PS> $variable_name = value
PS> foreach($item in $values){}
PS> [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes('whoami'))
PS> iex "$([System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('utf16_base64_encoded')))"
```
</div><div>

* `Format-List`: pretty print as list
* `pwsh`: run powershell on Linux
</div></div>