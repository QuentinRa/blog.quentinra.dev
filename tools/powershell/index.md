# Powershell

This is a program abstracting .Net (Common Language Runtime (CLR)), allowing us to run commands called cmdlets.

> **Notes**
> 
> * commands (and many things) are usually non-case sensitive (a=A)
> * **You can use some Linux commands on Windows**, as long as there is an alias to a Windows commands!
> * as in Linux terminals, you only have to use quotes when using specials characters

<hr class="sl">

## Basic commands

<details class="details-e mt-4">
<summary><code>Get-Help</code></summary>

<div class="row row-cols-md-2 mx-0"><div>

The most useful command on Linux is `man`, and it's the same on Windows, with `Get-Help`.

```powershell
PS \> Get-Help Get-ChildItem
```
</div><div>

If you "man" is quite empty, it's because you have to update it. Open a Powershell as administrator, and run Update-Help to update your help pages.

```powershell
PS \> Update-Help
```
</div></div>
</details>

<details class="details-e">
<summary><code>Get-ChildItem</code>: list directory content (<code>ls</code>)</summary>
<div class="row row-cols-md-2 mx-0"><div>

List files in the current directory

```powershell
PS \> Get-ChildItem
PS \> Get-ChildItem .
PS \> Get-ChildItem -Path .
```

List files in the directory "dir"

```powershell
PS \> Get-ChildItem "dir"
PS \> Get-ChildItem -Path "dir"
```

Filter files by pattern

```powershell
PS \> Get-ChildItem "dir" -Filter "a*"
```
</div><div>

Show only files

```powershell
PS \> Get-ChildItem -File
```

Show only folders

```powershell
PS \> Get-ChildItem -Directory
```

Show only hidden files/folders

```powershell
PS \> Get-ChildItem -Directory
```
</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>Get-Content</code>: print the content of a file (<code>cat</code>)</summary>

```powershell
PS \> Get-Content file.txt
```
</details>
</div><div>
<details class="details-e">
<summary><code>Set-Location</code>: move to another folder (<code>cd</code>)</summary>

```powershell
PS \> Set-Location "C:\"
PS \> Set-Location
PS \> Set-Location . # same
PS \> Set-Location ..
PS \> Set-Location ~
```
</details>
</div></div>

<hr class="sr">

## ...

...

<hr class="sl">

## Other commands

* `Get-FileHash`: return the hash of a file
  * `-Algorithm`: specify the algorithm

<hr class="sr">

## Notes

You can find new cmdlets that you will have to download first on Microsoft official website - [Sysinternals Miscellaneous Utilities](https://learn.microsoft.com/en-us/sysinternals/downloads/misc-utilities).