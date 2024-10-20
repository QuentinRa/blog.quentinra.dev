# EyeWitness

[![attacking_common_applications](../../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[EyeWitness](https://github.com/redsiege/EyeWitness) <small>(5.0k ⭐)</small> is a tool that can explore a large list of websites and give us informations such as default credentials.

It can work from nmap output. It's an alternative to [aquatone](aquatone.md).

```ps
$ sudo apt install eyewitness
$ sudo nmap example.com -p 80,443 -oX nmap_output.xml
$ eyewitness --web -x nmap_output.xml -d example.com
```

The `nmap` command above is only an example.
</div><div>
</div></div>