# Forced Browsing

[Go back](../index.md)

[![contentdiscovery](../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![webenumerationv2](../../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![picklerick](../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![vulnversity](../../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![basicpentestingjt](../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![blaster](../../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)
[![rrootme](../../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![startup](../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![wgelctf](../../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
![nibbles](../../../_badges/htb-p/nibbles.svg)

<div class="row row-cols-md-2"><div>

Forced browsing is a technique in which we test URLs crafted from a list of common files/folders and we try to find something juicy.

* 🧃 Configuration files <small>(ex: .config)</small>
* 👀 Old files <small>(ex: index.php.old)</small>
* 💵 Backup files <small>(ex: xxx.bak, backup.xxx)</small>
* 🔑 Admin/CMS panels <small>(ex: WordPress admin login page)</small>
* 💰 Private files <small>(ex: documents...)</small>

Most tools, namely web scanners, are used with [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md) below:

```text!
/usr/share/wordlists/dirb/common.txt
/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt
/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
/usr/share/wordlists/dirb/extensions_common.txt
```
</div><div>

You should use `common.txt` first, then move to `small`, and sometimes `medium`. They don't cover the same folders. In CTFs, common and small are usually enough.

Common tools are:

* [Gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md)
* [dirsearch](/cybersecurity/red-team/tools/enumeration/web/dirsearch.md)
* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md)
* [wfuzz](/cybersecurity/red-team/tools/enumeration/web/wfuzz.md)
* [feroxbuster](https://github.com/epi052/feroxbuster) (4.1k ⭐, Rust)
* [dirb](https://dirb.sourceforge.net/) (installable on any Debian)
* [DirBuster](https://github.com/KajanM/DirBuster) (0.1k ⭐)

It's worth noting that ffuf and wfuzz are NOT web scanners, but they can do the same as web scanner. Refer to [web fuzzing](fuzzing.md).
</div></div>