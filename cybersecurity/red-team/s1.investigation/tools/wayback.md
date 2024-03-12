# Wayback machine

[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![contentdiscovery](../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![ctfcollectionvol1](../../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)

<div class="row row-cols-lg-2"><div>

The [Wayback machine](https://archive.org/web/) is a website from which users can take snapshots (backups) of a website. Someone may have taken snapshots of the website, and you may find something in one of them.

* 💎 Something sensitive that was in the code but removed
* 💸 A page that was removed, but may be still available <small>(.old/hidden)</small>
* ...

There is a [python script](https://github.com/akamhy/waybackpy) <small>(0.4k ⭐, 2022 ☠️)</small> for command-line usage.
</div><div>

There is also a [go script](https://github.com/tomnomnom/waybackurls) <small>(3.1k ⭐, 2022 ☠️)</small>:

```ps
$ go install github.com/tomnomnom/waybackurls@latest
$ waybackurls example.com > urls
$ cat urls
<large output>
```
</div></div>