# Internet Information Services (IIS)

<div class="row row-cols-lg-2"><div>

Internet Information Services (IIS) is a niche web-server developed by Microsoft and mainly used on Active Directory networks.
</div><div>
</div></div>

<hr class="sep-both">

## IIS Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### IIS Tilde Enumeration

[![attacking_common_applications](../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

Windows [8.3 filename](https://en.wikipedia.org/wiki/8.3_filename), often called short name, is a mechanism on old versions of Windows to create an alias for long filenames. It's still present in modern versions of Windows.

```shell!
$ echo "x" > areallylongfilename.extension
$ dir /x
... AREALL~1.EXT areallylongfilename.extension
$ type AREALL~1.EXT
```

The tilde number `~1` is an incremental value that can be iterated if there are multiple files matching `"AREALL[...].EXT"`.

This can be used on an IIS server to discover files, while it doesn't expose the full name of the file. You can use [IIS-ShortName-Scanner](https://github.com/irsdl/IIS-ShortName-Scanner) <small>(1.3k ⭐)</small> or its newer implementation [shortscan](https://github.com/bitquark/shortscan) <small>(0.5k ⭐)</small>.

```shell!
$ go install github.com/bitquark/shortscan/cmd/shortscan@latest
$ shortscan http://IP
```

You may then try to brute force the full name from `text_found`, while shortscan will display potential values that you may try first.

```shell!
$ grep -r ^text_found /usr/share/wordlists/ | sed 's/^[^:]*://' > custom.lst
$ gobuster dir -u URL -w custom.lst -x extension
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `%WinDir%\System32\Inetsrv\Config\ApplicationHost.config`: configuration file
* Window Version to infer IIS version (default one)

[![granny](../../../../cybersecurity/_badges/htb-p/granny.svg)](https://app.hackthebox.com/machines/Granny)

* IIS v6 RCE (`iis_webdav_scstoragepathfromurl`)
</div><div>
</div></div>