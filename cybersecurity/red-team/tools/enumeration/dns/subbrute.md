# subbrute

[![attacking_common_services](../../../../_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

<div class="row row-cols-lg-2"><div>

[subbrute](https://github.com/TheRook/subbrute) <small>(3.4k ⭐, 2017 🪦)</small> is a tool that may be used to enumerate DNS information of a domain.

To brute force subdomains:

```ps
$ git clone https://github.com/TheRook/subbrute.git
$ cd subbrute
$ echo "ns1.xxx.yyy" > resolvers.txt
$ ./subbrute.py xxx.yyy -s wordlist.txt -r resolvers.txt -v
```
</div><div>

⚠️ You must add the domain + each resolver in your host file.
</div></div>