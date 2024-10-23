# Nginx

[![filetransfers](../../../../cybersecurity/_badges/htb/filetransfers.svg)](https://academy.hackthebox.com/course/preview/file-transfers)

<div class="row row-cols-lg-2"><div>

Nginx is a powerful and widely-used open-source web server. It's the main concurrent of [Apache](/operating-systems/cloud/webservers/apache/index.md). It's an event-based web server known to be faster and more powerful than Apache.

```shell!
$ cat nginx.conf 
events {}

http {
    server {
        listen 80;
        server_name localhost;

        # Reverse Proxy setting "Host: ..."
        location / {
            proxy_pass http://real_target:port/
            proxy_set_header Host $http_host;
        }
    }
}
```
</div><div>

```shell!
$ cat docker-compose.yml 
version: '3'
services:
  nginx:
    image: nginx:latest
    ports:
      - "8000:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
$ docker compose up   # no "-d" to see the logs
$ docker compose down # clean up
```

This reverse proxy configuration will allow you to access `http://real_target:port/` from `localhost:8000` while setting the header host to `Host: localhost:8000` which is convenient during pentesting.
</div></div>

<hr class="sep-both">

## Nginx Misconfigurations

<div class="row row-cols-lg-2"><div>

#### Nginx Alias Misconfiguration

[![nginx_alias_misconfiguration](../../../../cybersecurity/_badges/rootme/web_server/nginx_alias_misconfiguration.svg)](https://www.root-me.org/en/Challenges/Web-Server/Nginx-Alias-Misconfiguration)

To map a route to a path, we should not use alias. Otherwise, malicious users will be able to escape the exposed folder using `../`:

```diff
- # Can use http://localhost/assets../ to access "/app"
location /assets/ {
-    alias /app/assets/;
+    root /app/assets/;
}
```

➡️ Known tool to exploit this: [Kyubi](https://github.com/shiblisec/Kyubi) <small>(0.1k ⭐)</small>.
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