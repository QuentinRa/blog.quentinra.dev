# Powershell

* ⚡ Quotes are only needed when using specials characters

You can use `clear` to clear the terminal, and `gcm command` to find what cmdlet is your alias pointing to.

You can find new cmdlets that you will have to download first on Microsoft official website - [Sysinternals Miscellaneous Utilities](https://learn.microsoft.com/en-us/sysinternals/downloads/misc-utilities).

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

To change the keyboard language to French: `Set-WinUserLanguageList -LanguageList  fr-FR, en-US -force` ([source](https://stackoverflow.com/questions/56820526/how-to-change-keyboard-layout-in-windows-console-cmd-or-wsl)).

* dot sourcing: `. xxx.ps1`
* Windows installer files (also known as .msi files) are used to install applications on the system. 
* AllSigned (and others modes|Get-ExecutionPolicy)
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