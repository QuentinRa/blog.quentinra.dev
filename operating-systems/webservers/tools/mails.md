# Mail server

<div class="row row-cols-md-2"><div>

Configuring a mail server involves two aspects:

* 📩 Sending mails
* 📨 Receiving mails

To avoid having our mails being marked as spam, we have to properly configure our mail server and DNS records.
</div><div>

You can send emails after configuring an [MTA](/operating-systems/networking/protocols/smtp.md) using:

```ps
$ sudo apt install mailutils
$ echo "body" | mail -s "subject" email
```
</div></div>

<hr class="sep-both">

## Postfix

<div class="row row-cols-md-2"><div>

[Postfix](https://github.com/vdukhovni/postfix) <small>(0.3k ⭐)</small> is a well-known MTA.

```ps
$ sudo apt install postfix
$ sudo nano /etc/postfix/main.cf
# edit those lines to match:
# inet_interfaces = loopback-only
# mydestination = $myhostname, localhost.$mydomain, $mydomain
$ sudo systemctl restart postfix
```
</div><div>
</div></div>