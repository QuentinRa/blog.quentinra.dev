# Powershell

This is a program abstracting .Net (Common Language Runtime (CLR)), allowing us to run commands called cmdlets.

<hr class="sl">

## Basic commands

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