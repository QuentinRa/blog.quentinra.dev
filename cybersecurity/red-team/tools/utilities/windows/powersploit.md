# PowerSploit

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

[PowerSploit](https://github.com/PowerShellMafia/PowerSploit/) <small>(11.5k ⭐, 2017 🪦)</small> is the latest version of [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) and [PowerUp](https://github.com/HarmJ0y/PowerUp) which are dead too since 2014/2015.
</div><div>
</div></div>

<hr class="sep-both">

## PowerView

<div class="row row-cols-lg-2"><div>

[PowerView](https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/PowerView.ps1) is a module part of PowerSploit.

```ps
PS> Import-Module .\PowerView.ps1
```

<br>

#### PowerView — Domain Enumeration

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

Get information on the domain:

```ps
PS> Get-DomainSID
PS> Get-DomainPolicy
PS> Get-DomainUser -Identity username -Domain example.com
OS> Get-DomainGroup -Identity "XXX" | select memberof
PS> Get-DomainGroupMember -Identity "Domain Admins" -Recurse
PS> Get-DomainTrustMapping
PS> Test-AdminAccess -ComputerName TARGET_HOST
PS> Get-DomainUser -SPN -Properties samaccountname,ServicePrincipalName
PS> Get-DomainUser cn -Properties samaccountname,serviceprincipalname,msds-supportedencryptiontypes # encryption scheme
PS> Get-DomainUser -Identity cn | Get-DomainSPNTicket -Format Hashcat | Export-Csv .\xxx.csv -NoTypeInformation
PS> Get-DomainUser -Identity * | ? {$_.useraccountcontrol -like '*XXX*'} | select samaccountname,useraccountcontrol
PS> Get-DomainUser -PreauthNotRequired | select samaccountname,userprincipalname,useraccountcontrol | fl
PS> Get-DomainUser -UACFilter PASSWD_NOTREQD | Select-Object samaccountname,useraccountcontrol
```
</div><div>

#### PowerView — Trust Relationships

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

```ps
PS> Get-DomainTrust
PS> Get-DomainTrustMapping
PS> Get-DomainUser -Domain dev.example.com | select SamAccountName
```

<br>

#### PowerView — ACE-related commands

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

```ps
PS> Find-InterestingDomainAcl
PS> $sid = Convert-NameToSid username
PS> Get-DomainObjectACL -Identity cn | ? {$_.SecurityIdentifier -eq $sid}
PS> Get-DomainObjectACL -ResolveGUIDs -Identity cn | ? {$_.SecurityIdentifier -eq $sid}
PS> Get-ObjectAcl "DC=example,DC=com" -ResolveGUIDs
```

<br>

#### PowerView — PS1 Alternatives

There is a C# port called [SharpView](https://github.com/tevora-threat/SharpView) <small>(0.9k ⭐, 2018 🪦)</small>.

```ps
PS> .\SharpView.exe Get-DomainUser -Identity username
```

There is a Python port called [powerview.py](https://github.com/aniqfakhrul/powerview.py) <small>(0.3k ⭐)</small>.
</div></div>