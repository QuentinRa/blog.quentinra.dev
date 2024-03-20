# PowerSploit

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

[PowerSploit](https://github.com/PowerShellMafia/PowerSploit/) <small>(11.4k ⭐, 2017 🪦)</small> is the latest version of [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) and [PowerUp](https://github.com/HarmJ0y/PowerUp) which are dead too since 2014/2015.
</div><div>

* [PowerView Module](https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/PowerView.ps1) or [SharpView](https://github.com/tevora-threat/SharpView) <small>(0.9k ⭐)</small>

```ps
PS> import-module .\PowerView.ps1
PS> Get-DomainPolicy
PS> Get-DomainUser -Identity username -Domain example.com
PS> Get-DomainGroupMember -Identity "Domain Admins" -Recurse
PS> Get-DomainTrustMapping
PS> Test-AdminAccess -ComputerName TARGET_HOST
PS> Get-DomainUser -SPN -Properties samaccountname,ServicePrincipalName
```
```ps
PS> .\SharpView.exe Get-DomainUser -Identity username
```
</div></div>