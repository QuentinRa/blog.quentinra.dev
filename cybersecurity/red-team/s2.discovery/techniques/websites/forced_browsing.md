# Forced Browsing

[![contentdiscovery](../../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![webenumerationv2](../../../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![picklerick](../../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![vulnversity](../../../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![basicpentestingjt](../../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![blaster](../../../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)
[![rrootme](../../../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![startup](../../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![wgelctf](../../../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
[![allinonemj](../../../../_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)
[![mustacchio](../../../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)
[![chillhack](../../../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
![nibbles](../../../../_badges/htb-p/nibbles.svg)
[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cozyhosting](../../../../_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![bashed](../../../../_badges/htb-p/bashed.svg)](https://app.hackthebox.com/machines/Bashed)
[![backup_file](../../../../_badges/rootme/web_server/backup_file.svg)](https://www.root-me.org/en/Challenges/Web-Server/Backup-file)

<div class="row row-cols-lg-2"><div>

Forced browsing is a technique in which we test URLs crafted from a list of common files/folders and we try to find something juicy.

* 🧃 Configuration files <small>(ex: .config)</small>
* 👀 Old files <small>(ex: index.php.old)</small>
* 💵 Backup files <small>(ex: xxx.bak, backup.xxx, xxx~)</small>
* 🔑 Admin/CMS panels <small>(ex: WordPress admin login page)</small>
* 💰 Private files <small>(ex: documents...)</small>

Refer to [wordlists#forced browsing](/cybersecurity/red-team/_knowledge/topics/wordlists.md#forced-browsing) for wordlists. ⚠️ Start with small wordlists, then move to bigger one. They don't have the same entries. 
</div><div>

Common tools are:

* [Gobuster](/cybersecurity/red-team/tools/enumeration/web/gobuster.md)
* [dirsearch](/cybersecurity/red-team/tools/enumeration/web/dirsearch.md)
* [ffuf](/cybersecurity/red-team/tools/enumeration/web/ffuf.md#ffuf)
* [wfuzz](/cybersecurity/red-team/tools/enumeration/web/wfuzz.md)
* [feroxbuster](https://github.com/epi052/feroxbuster) (4.1k ⭐, Rust)
* [dirb](https://dirb.sourceforge.net/) (installable on any Debian)
* [DirBuster](https://github.com/KajanM/DirBuster) (0.1k ⭐)
</div></div>