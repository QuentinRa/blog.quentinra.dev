# aquatone

[![web_information_gathering](../../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![attacking_common_applications](../../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[Aquatone](https://github.com/michenriksen/aquatone) <small>(5.7k ⭐, 2019 🪦)</small> is a tool often used when given a large list of websites we want to get a preview of each.

```ps
$ go install github.com/michenriksen/aquatone@latest
$ cat urls.lst | aquatone
```

Unfortunately, it doesn't work with recent versions of go.
</div><div>

We can use the latest packaged version if we don't want to fix it.

```shell!
$ get https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
$ sudo unzip aquatone_linux_amd64_1.7.0.zip -d /opt/aquatone
$ sudo ln -s /opt/aquatone/aquatone /usr/local/bin/aquatone
$ echo 'example.com' | aquatone
$ firefox aquatone_report.html
```
</div></div>