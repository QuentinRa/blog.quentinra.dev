# Mail server

<div class="row row-cols-lg-2"><div>

Configuring a mail server involves two aspects:

* 📩 Sending mails
* 📨 Receiving mails

To avoid having our emails marked as spam, we have to properly configure our mail server and DNS records.
</div><div>

You can send emails after configuring an [MTA](/operating-systems/networking/protocols/smtp.md) using:

```ps
$ sudo apt install mailutils
$ echo "body" | mail -s "subject" email
```
</div></div>

<hr class="sep-both">

## Postfix

<div class="row row-cols-lg-2"><div>

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

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* DMarc
* SPF ([SPF](https://www.digitalocean.com/community/tutorials/how-to-use-an-spf-record-to-prevent-spoofing-improve-e-mail-reliability))
* DKim ([DKIM with postfix](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-dkim-with-postfix-on-debian-wheezy))
* [mail-tester.com](https://www.mail-tester.com/) <small>(wait XXX hours for DNS record changes)</small>
</div><div>
</div></div>