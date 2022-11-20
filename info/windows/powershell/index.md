# Powershell

<div class="row row-cols-md-2"><div class="align-self-center">

This is a program abstracting .NET Common Language Runtime (CLR), allowing us to run commands called cmdlets.
</div><div>

* 🤯 Commands/Paths are case insensitive <small>(a=A)</small>
* 📝 Many Linux commands are available <small>(aliases to Windows commands)</small>
* ⚡ Quotes are only needed when using specials characters
...
</div></div>

> See [Comparison of cmdlets with similar commands](https://en.wikipedia.org/wiki/PowerShell#Comparison_of_cmdlets_with_similar_commands).

⚠️ Note that for the whole course, if you see `Get-Help` (`help`), it means that you can use either of them, both will work.

<hr class="sl">

## Basic commands

You can use `clear` to clear the terminal, and `gcm command` to find what cmdlet is your alias pointing to.

<details class="details-e mt-4">
<summary><code>Get-Help</code>: sort of linux man (<code>help</code>)</summary>

<div class="row row-cols-md-2 mx-0"><div>

The most useful command on Linux is `man`, and it's the same on Windows, with `Get-Help`.

```powershell
PS> Get-Help Get-ChildItem
```
</div><div>

If you "man" is quite empty, it's because you have to update it. Open a Powershell as administrator, and run Update-Help to update your help pages.

```powershell
PS> Update-Help
```
</div></div>
</details>

<details class="details-e">
<summary><code>Get-ChildItem</code>: list directory content (<code>ls</code>)</summary>
<div class="row row-cols-md-2 mx-0"><div>

List files in the current directory

```powershell
PS> Get-ChildItem
PS> Get-ChildItem .
PS> Get-ChildItem -Path .
```

List files in the directory "dir"

```powershell
PS> Get-ChildItem "dir"
PS> Get-ChildItem -Path "dir"
```

Filter files by pattern

```powershell
PS> Get-ChildItem "dir" -Filter "a*"
```
</div><div>

Show only files

```powershell
PS> Get-ChildItem -File
```

Show only folders

```powershell
PS> Get-ChildItem -Directory
```

Show only hidden files/folders

```powershell
PS> Get-ChildItem -Directory
```
</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>Get-Content</code>: print the content of a file (<code>cat</code>)</summary>

```powershell
PS> Get-Content file.txt
```
</details>
</div><div>
<details class="details-e">
<summary><code>Set-Location</code>: move to another folder (<code>cd</code>)</summary>

```powershell
PS> Set-Location "C:\"
PS> Set-Location
PS> Set-Location . # same
PS> Set-Location ..
PS> Set-Location ~
```
</details>
</div></div>

<hr class="sr">

## Text utilities

<div class="row row-cols-md-2 mt-4"><div>
<details class="details-e">
<summary><code>Measure-Object</code>: count the letters/words/... (<code>wc</code>)</summary>

```powershell
PS> Get-Content path_to_some_file  | Measure-Object
PS> Get-Content path_to_some_file  | Measure-Object -Word
PS> Get-Content path_to_some_file  | Measure-Object -Line -Character -Word
PS> Get-Content path_to_some_file  | Measure-Object -Minimum -Maximum
```
</details>
</div><div>
<details class="details-e">
<summary><code>Select-String</code>: find a motif in a tex (<code>grep</code>)</summary>

```powershell
PS> Select-String -Pattern 'some_pattern' -Path path_to_some_file
```
</details>
</div></div>

<hr class="sl">

## Other commands

<div class="row row-cols-md-2 mt-4"><div>

<details class="details-e">
<summary><code>Get-FileHash</code>: return the hash of a file</summary>

```powershell
PS> Get-FileHash path_to_file
PS> Get-FileHash path_to_file -Algorithm MD5
```
</details>
</div><div>

<details class="details-e">
<summary><code>Get-FileHash</code>: fetch web resource (<code>wget/iwr</code>)</summary>

```powershell
PS> Invoke-WebRequest URL -o output
PS> Invoke-WebRequest -uri URL -outfile output
```
</details>
</div></div>

<hr class="sr">

## Notes

You can find new cmdlets that you will have to download first on Microsoft official website - [Sysinternals Miscellaneous Utilities](https://learn.microsoft.com/en-us/sysinternals/downloads/misc-utilities).