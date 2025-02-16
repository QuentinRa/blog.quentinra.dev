# Forced Browsing

<div class="row row-cols-lg-2"><div>

</div><div>

For extensions: `php,html,txt,sql,bak,tar,tar.gz,db,zip,sqlite`.
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### Version Control Files Disclosure

[![githappens](../../../../_badges/thm-p/githappens.svg)](https://tryhackme.com/room/githappens)
[![insecure_code_management](../../../../_badges/rootme/web_server/insecure_code_management.svg)](https://www.root-me.org/en/Challenges/Web-Server/Insecure-Code-Management)
[![starbug_bounty](../../../../_badges/rootme/realist/starbug_bounty.svg)](https://www.root-me.org/en/Challenges/Realist/Starbug-Bounty)

Sometimes, version control files such as [.git for GIT](/tools-and-frameworks/vcs/git/_general/index.md) may be exposed. They can be used to find the current and the previous versions of the code. For instance, after downloading a `.git`:

```ps
$ cd .git
$ git diff                  # it says the code is missing
$ git restore *             # restore current version
$ git log -p -- config.php  # look at config.php history
$ git show commit_id
```

A few automated tools: [GitHacker](https://github.com/WangYihang/GitHacker) <small>(1.4k ⭐, 2023 🪦)</small> [GitTools](https://github.com/internetwache/GitTools)  <small>(3.8k ⭐, 2022 🪦, 👻)</small>, [GitHack](https://github.com/lijiejie/GitHack)  <small>(3.1k ⭐, 2022 🪦)</small> and [git-dumper](https://github.com/arthaud/git-dumper/tree/master) <small>(1.8k ⭐)</small>.

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