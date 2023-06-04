# Powershell

<div class="row row-cols-md-2"><div class="align-self-center">

</div><div>

* ⚡ Quotes are only needed when using specials characters
...
</div></div>

<hr class="sl">

## Basic commands

You can use `clear` to clear the terminal, and `gcm command` to find what cmdlet is your alias pointing to.

<hr class="sr">

## Text utilities

<div class="row row-cols-md-2 mt-4"><div>
<details class="details-n">
<summary><code>Measure-Object</code>: count the letters/words/... <small>(alias: <code>wc</code>)</small></summary>

```powershell
PS> Get-Content path_to_some_file  | Measure-Object
PS> Get-Content path_to_some_file  | Measure-Object -Word
PS> Get-Content path_to_some_file  | Measure-Object -Line -Character -Word
PS> Get-Content path_to_some_file  | Measure-Object -Minimum -Maximum
```
</details>
</div><div>
<details class="details-n">
<summary><code>Select-String</code>: find a motif in a tex <small>(alias: <code>grep</code>)</small></summary>

```powershell
PS> Select-String -Pattern 'some_pattern' -Path path_to_some_file
```
</details>
</div></div>

<hr class="sl">

## Other commands

<div class="row row-cols-md-2 mt-4"><div>

<details class="details-n">
<summary><code>Get-FileHash</code>: return the hash of a file</summary>

```powershell
PS> Get-FileHash path_to_file
PS> Get-FileHash path_to_file -Algorithm MD5
```

</details>
</div><div>

<details class="details-n">
<summary><code>Invoke-WebRequest</code>: fetch web resource <small>(aliases: <code>wget/iwr</code>)</small></summary>

```powershell
PS> Invoke-WebRequest URL -o output
PS> Invoke-WebRequest -uri URL -outfile output
```
</details>
</div></div>

<hr class="sr">

## Notes

You can find new cmdlets that you will have to download first on Microsoft official website - [Sysinternals Miscellaneous Utilities](https://learn.microsoft.com/en-us/sysinternals/downloads/misc-utilities).

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

To change the keyboard language to French: `Set-WinUserLanguageList -LanguageList  fr-FR, en-US -force` ([source](https://stackoverflow.com/questions/56820526/how-to-change-keyboard-layout-in-windows-console-cmd-or-wsl)).

* dot sourcing: `. xxx.ps1`
* Windows installer files (also known as .msi files) are used to install applications on the system. 
* AllSigned (and others modes|Get-ExecutionPolicy)
* Get-Service -name spooler 
* Stop-Service -name spooler 
* Start-Service -name spooler 
* ISE

```
PS> . $Env:TMP/script.ps1; script
```
</div><div>

```powershell
PS> sass
sass.ps1 cannot be loaded because running scripts is disabled on this system. For more information, see about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
PS> Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
```
</div></div>