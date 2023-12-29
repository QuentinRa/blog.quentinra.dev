# Nginx

[![filetransfers](../../../../cybersecurity/_badges/htb/filetransfers.svg)](https://academy.hackthebox.com/course/preview/file-transfers)

<div class="row row-cols-lg-2"><div>

Nginx is a powerful and widely-used open-source web server. It's the main concurrent of [Apache](/operating-systems/cloud/webservers/apache/index.md). It's an event-based web server known to be faster and more powerful than Apache.
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `/etc/nginx/nginx.conf`: configuration file
* `/var/log/nginx/`: logs
* [lemp](https://lemp.io/)
</div><div>

```shell!
$ # server { listen, location {root, dav_methods PUT} }
$ sudo ln -s /etc/nginx/sites-available/xxx.conf /etc/nginx/sites-enabled/
$ sudo rm /etc/nginx/sites-enabled/default # default conf
$ sudo nginx -t
$ sudo systemctl restart nginx.service
```
</div></div>