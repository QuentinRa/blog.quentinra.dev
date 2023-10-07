# Logging and monitoring

<div class="row row-cols-md-2"><div>

Logging is the process of monitoring events, mostly to

* 🔎 to detect suspicious activities
* ⚖️ to comply with investigations or legal regulations
* 🚀 to monitor and improve performances
* 🐛 to troubleshoot issues

➡️ It's important to analyze what the organization needs to log.
</div><div>

Logs can be generated from multiple sources which must be identified

* 💻 Workstations <small>(Windows 10/11...)</small> and Servers
* 📚 Applications and databases
* 📶 Routers, Switches, Firewalls, Antivirus, IDS...
* ...
</div></div>

<hr class="sep-both">

## What to log?

<div class="row row-cols-md-2"><div>

There are 4 main categories of logs:

* **User actions** 🧔: successful and failed login attempts, creation or suppression of users, change of permissions, attempts at privilege escalation <small>(su/sudo/runas)</small>...
* **System actions** 💻: application/services started/stopped, startup and shutdown, change to system settings...
* **Application events** 🖨️: user actions, warnings, errors...
* **Network events** 📶: incoming/outgoing traffic...
</div><div>

Usually, the minimal information needed to provide useful logs are:

* Date and time of the event
* Source and destination IP addresses or hostnames
* Event type or category <small>(e.g. login, file access, network traffic)</small>
* User ID <small>(if applicable)</small>
* Outcome of the event <small>(success or failure)</small>

🎯 Ensure that clocks are synchronized <small>(see the NTP protocol)</small>.
</div></div>

<hr class="sep-both">

## How to collect logs

<div class="row row-cols-md-2"><div>

There are two methods to collect logs:

* **with an agent** (an additional software)
* **without an agent** (agentless)

👉 Try to use native "services" such as syslog <small>(if applicable)</small>.

There are two methods to transfer logs:

* **Pull** 🛻: the server requests the logs <small>(sftp...)</small>
* **Push** 🚀: the component sends its logs without being requested <small>(syslog, snmp, using a script, SFTP...)</small>

We can use UDP to transfer logs if we can accept a potential loss, otherwise, TCP should be used instead.

<br>

#### Collectors

It's possible to set up a collector that will collect the logs of a "zone", and transfer them to the server. This has a cost but allows better use of the bandwidth.

A collector can be Agent-based, Syslog-based, or Forwarding-based.
</div><div>


#### Centralized logs

Centralized logging means centralizing every log on one server.

* we must ensure that logs are not tampered
* we must closely monitor them to detect unusual activity
* we must ensure that the person accessing the logs (read/write) has the right to do it. For instance, if there are logs with confidential data, their access should be restricted.
* it's recommended to keep a raw version of the logs

<br>

#### Security Information and Event Management (SIEM)

A SIEM is a centralized logging solution that should detect attacks by correlating logs <small>(temporal, based on the source/destination...)</small> and alert/notify people. It can also generate reports.

* Splunk
* Microsoft
* IBM
* ...

➡️ Search for "Gartner SIEM". You should examine the number of events per second and the cost of configuring it when picking one.
</div></div>

<hr class="sep-both">

## Prioritization and alerting

<div class="row row-cols-md-2"><div>

As we will have many logs, we need to prioritize them

* **Priority 1**: critical events that require immediate intervention <small>(ex: system/IDS/antivirus crash, access to admin accounts...)</small>
* **Priority 2**: important events that require attention <small>(ex: failed login attempts, system/application warnings/errors...)</small>
* **Priority 3**: informal events <small>(ex: successful login attempts...)</small>
</div><div>

When events occur, there is a need to notify the stakeholders. Both persons to contact and methods of contact should have been defined, most likely in accordance with the event priority.

Some methods of contact 📨: SMS, email, push notification...
</div></div>

<hr class="sep-both">

## Common log files locations

[![linuxfundamentalspart3](../_badges/thm/linuxfundamentalspart3.svg)](https://tryhackme.com/room/linuxfundamentalspart3)
[![adventofcyber4](../_badges/thm/adventofcyber4/day2.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-md-2"><div>

* `/var/log/syslog` and `/var/log/messages` <small>(general and system logs)</small>
* `/var/log/auth.log` and `/var/log/secure` <small>(authentication attempts)</small>
* `/var/log/kern.log` <small>(kernel messages)</small>
* `/var/log/dmesg` <small>(driver messages)</small>
* `/var/log/audit/audit.log` <small>(audit logs)</small>
* `/var/log/nginx/` and `/var/log/apache2/` <small>(webserver logs)</small>
* `/var/log/mysql/` and `/var/log/postgresql/` <small>(dbms logs)</small>
* `/var/log/cron` <small>(cron logs)</small>
* `/var/log/boot.log` <small>(boot messages)</small>
* `/var/log/lastlog` <small>(last logins)</small>
</div><div>

* `/var/log/faillog` <small>(failed logins)</small>
* `/var/log/btmp` <small>(failed logins)</small>
* `/var/log/utmp` <small>(current users)</small>
* `/var/log/wtmp` <small>(record of every login/logout)</small>
* `/var/log/maillog` <small>(mail events)</small>
* `/var/log/dpkg.log` <small>(installed packages)</small>

On Windows, check out **Windows Event Viewer**.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* SIEM (SIM+SEM)
* SIM=Security Information Management=collect, monitor, analyze logs
* SEM=Security Event Management=real-time analysis, alerts
* Configuration come at a cost, logs may still have to be checked manually if not correctly configured
* [windowseventlogs](https://tryhackme.com/room/windowseventlogs)
* [endpoint-security-monitoring](https://tryhackme.com/module/endpoint-security-monitoring)
* [security-information-event-management](https://tryhackme.com/module/security-information-event-management)
</div><div>

* Auditing
* Connected as unusual hours
* Unusual traffic at unusual hours
* Copy or a big amount of data
* AD Audit policy best practices
* Handle scenario in which you can't access the logs
* How log do we store logs? Minimum of 3y?
* "You're monitored" (users more responsible)
* access to resources
* protect logs
* confidential data in logs
* Syslog server/rsyslog
* [prometheus](https://github.com/prometheus/prometheus)
</div></div>