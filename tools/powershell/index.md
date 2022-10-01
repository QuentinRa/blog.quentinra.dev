# Powershell

This is a program abstracting .Net (Common Language Runtime (CLR)), allowing us to run commands called cmdlets.

<hr class="sl">

## Basic commands

<details class="details-e mt-4" open>
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
<summary><code>Get-Content</code>: basically <code>cat</code></summary>

```powershell
PS \> Get-Content file.txt
```
</details>
</div><div>
<details class="details-e">
<summary><code>Set-Location</code>: basically <code>cd</code></summary>

```powershell
PS \> Set-Location "C:\"
PS \> Set-Location
PS \> Set-Location . # same
PS \> Set-Location ..
PS \> Set-Location ~
```
</details>
</div></div>    