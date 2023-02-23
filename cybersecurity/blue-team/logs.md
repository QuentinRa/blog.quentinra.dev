# Logging and monitoring

<div class="row row-cols-md-2"><div>

Logging is the process of monitoring events, mostly to

* 🔎 to detect suspicious activities
* ⚖️ to comply with investigations or legal regulations
* 🚀 to monitor and improve performances
* 🐛 to troubleshoot issues

➡️ It's important to analyze what the organization need to log.
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

* **User actions** 🧔: successful and failed login attempts, creation or suppression of users, change of permissions, tentatives of privilege escalation <small>(su/sudo/runas)</small>...
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

🎯 Ensure that all computers are synchronized on the current time.
</div></div>