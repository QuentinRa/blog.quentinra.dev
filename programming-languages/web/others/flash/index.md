# Adobe Flash

[![flash_authentication](../../../../cybersecurity/_badges/rootme/web_client/flash_authentication.svg)](https://www.root-me.org/en/Challenges/Web-Client/Flash-Authentication)

<div class="row row-cols-lg-2"><div>

Adobe Flash was a software to create rich internet applications (RIAs) from the late 1990 until its decline in 2010.

It became discontinued on December 31, 2020, due to vulnerabilities.

Flash content was typically delivered in the form of SWF files. They can be decompiled to ActionScript using tools such as [jpexs](https://github.com/jindrapetrik/jpexs-decompiler) <small>(4.6k ⭐)</small>.

```shell!
$ wget "https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version21.0.1/ffdec_21.0.1.deb" -O /tmp/ffdec.deb
$ sudo dpkg -i /tmp/ffdec.deb
$ ffdec # java
```

📚 There are 3 views (res, tags, hexdump). Click on something, then select "export selection" to dump it.
</div><div>

A few notes:

* `ExternalInterface.call()`: call a function defined in the JavaScript
* `.swf`: the extension of Flash apps. The file starts with "CWS".
* [swftools](https://github.com/swftools/swftools) <small>(0.3k ⭐)</small>: utilities to manipulate SWF files
</div></div>