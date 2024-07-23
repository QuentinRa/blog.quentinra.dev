# Forced Browsing

[![contentdiscovery](../../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day24.svg)](https://tryhackme.com/room/adventofcyber2)
[![webenumerationv2](../../../../_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![sqlmap](../../../../_badges/thm/sqlmap.svg)](https://tryhackme.com/room/sqlmap)
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
[![githappens](../../../../_badges/thm-p/githappens.svg)](https://tryhackme.com/room/githappens)
[![lianyu](../../../../_badges/thm-p/lianyu.svg)](https://tryhackme.com/room/lianyu)
[![easypeasyctf](../../../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)
[![gamingserver](../../../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![cyborgt8](../../../../_badges/thm-p/cyborgt8.svg)](https://tryhackme.com/room/cyborgt8)
[![md2pdf](../../../../_badges/thm-p/md2pdf.svg)](https://tryhackme.com/r/room/md2pdf)
[![surfer](../../../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)
[![bruteit](../../../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)
[![archangel](../../../../_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![teamcw](../../../../_badges/thm-p/teamcw.svg)](https://tryhackme.com/r/room/teamcw)
[![pythonplayground](../../../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)
[![techsupp0rt1](../../../../_badges/thm-p/techsupp0rt1.svg)](https://tryhackme.com/r/room/techsupp0rt1)
[![nax](../../../../_badges/thm-p/nax.svg)](https://tryhackme.com/r/room/nax)
![nibbles](../../../../_badges/htb-p/nibbles.svg)
[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cozyhosting](../../../../_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![bashed](../../../../_badges/htb-p/bashed.svg)](https://app.hackthebox.com/machines/Bashed)
[![blocky](../../../../_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)
[![backup_file](../../../../_badges/rootme/web_server/backup_file.svg)](https://www.root-me.org/en/Challenges/Web-Server/Backup-file)
[![php_register_globals](../../../../_badges/rootme/web_server/php_register_globals.svg)](https://www.root-me.org/en/Challenges/Web-Server/PHP-register-globals)

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
* [feroxbuster](https://github.com/epi052/feroxbuster) <small>(5.2k ⭐, Rust)</small>
* [dirb](https://dirb.sourceforge.net/) <small>(installable on any Debian)</small>
* [DirBuster](https://github.com/KajanM/DirBuster) <small>(0.1k ⭐)</small>

For extensions: `php,html,txt,sql,bak,tar,tar.gz,db,zip,sqlite`.
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### Version Control Files Disclosure

[![githappens](../../../../_badges/thm-p/githappens.svg)](https://tryhackme.com/room/githappens)
[![insecure_code_management](../../../../_badges/rootme/web_server/insecure_code_management.svg)](https://www.root-me.org/en/Challenges/Web-Server/Insecure-Code-Management)

Sometimes, version control files such as [.git for GIT](/tools-and-frameworks/vcs/git/_general/index.md) may be exposed. They can be used to find the current and the previous versions of the code. For instance, after downloading a `.git`:

```ps
$ cd .git
$ git diff                  # it says the code is missing
$ git restore *             # restore current version
$ git log -p -- config.php  # look at config.php history
$ git show commit_id
```

A few automated tools: [GitHacker](https://github.com/WangYihang/GitHacker) <small>(1.3k ⭐, 2023 🪦)</small> [GitTools](https://github.com/internetwache/GitTools)  <small>(3.7k ⭐, 2022 🪦, 👻)</small>, [GitHack](https://github.com/lijiejie/GitHack)  <small>(2.9k ⭐, 2022 🪦)</small> and [git-dumper](https://github.com/arthaud/git-dumper/tree/master) <small>(1.6k ⭐)</small>.

```shell!
$ DEST="$HOME/tools/gitdumper"
$ git clone -b "master" https://github.com/arthaud/git-dumper $DEST
$ git-dumper URL/.git/ dump
```

📚 `.git` may be blocked (403) but `.git/index`, `.git/HEAD`, etc. may not. 

⚠️ We are downloading potentially harmful files. This is **dangerous** as it may lead to RCE. Manually check the git configuration files before running any `git` commands!
</div><div>

#### Composer Vendor Folder Exposure

[![surfer](../../../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)

[Composer](/programming-languages/web/php/composer/index.md) is a package manager for PHP. From `composer.json`, it creates a `vendor` folder with the PHP packages.

This folder should not be available for remote users.

#### CGI Scripts

[![attacking_common_applications](../../../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day12.svg)](https://tryhackme.com/room/adventofcyber2)
[![shocker](../../../../_badges/htb-p/shocker.svg)](https://app.hackthebox.com/machines/Shocker)

Common Gateway Interface (CGI) Applications are rarely used as they are dangerous. They were often used to connect multiple applications. CGI scripts can be written in many languages. They have a few advantages and many major disadvantages. To look for them:

```shell!
$ ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u URL/cgi/FUZZ -e .bat,.cmd
$ ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u URL/cgi-bin/FUZZ -e .cgi,.pl,.c,.sh,.py
```

📚 Apache Tomcat returns 404 for `/cgi` even when it exists.

⚠️ Bash `[<4.3]` has a vulnerability called [shellshock](https://nvd.nist.gov/vuln/detail/CVE-2014-6271), that can also be exploited with metasploit (`apache_mod_cgi_bash_env_exec`):

```shell!
$ curl -H 'User-Agent: () { :; }; <write code here>' 'URL/cgi-bin/some_script'
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![blocky](../../../../_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)

* AJax Rendered Page, automation?
* .DS_STORE, contains a list of files, [blog](https://miloserdov.org/?p=3867)
</div><div>
</div></div>