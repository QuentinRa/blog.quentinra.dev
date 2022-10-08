# Notes

* **offensive**

Look for vulnerabilities. **penetration tester** (web security, 
network security knowledge, use various programming languages, cloud security)

* **defensive Security**. 
  * **Security Analyst** (monitor - splunk?)
  * **Incident Responder** (impact? goal? what can they do? - Volatility?)
  * **malware analysis**

Detect, and stop attacks.

<hr class="sep-both">

## Web

"You need to understand a website, to find weakness, and process hacking a website."

* Try hacking "reset password"

<hr class="sep-both">

## know how?

Attack a vulnerable machine, scan the network to discover more vulnerable machines.

<hr class="sep-both">

## Linux

* `<command> <flag> <input>`
* `&` bg
* `$USER`, `export <varname>=<value>`
* `cat -`
* `;`
* ugo or uge = everyone else?
* `/etc/shadow`
* `Secure copy, or SCP` scp file_to_upload user@ip:path/to/upload scp user@ip:path/to/ddl dest
* python3 -m  http.server: start web server, was used to open a "root" file without perms
* `ps aux`: process not attached to a session / belonging to others
* `top`, `kill` SIGTERM (soft kill, allow cleanup), SIGSTOP (suspend), SIGKILL (kill)
* `systemctl` allow to interact with the systemd process/daemon
  * `systemctl start apache2` (start, stop, enable, disable)
* `cron` process to schedule tasks, with `crontabs` (file)
  * ...
  * https://crontab-generator.org/
  * https://crontab.guru/
  * edit `crontab -e`
* `dpkg` / apt in /etc/apt/sources.list.d
* Logs
  * `/var/log`
    * ufw: firewall
    * apache
    * fail2ban

<hr class="sep-both">

## Tools

* Putty