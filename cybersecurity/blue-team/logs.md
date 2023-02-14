# Logging and monitoring

<div class="row row-cols-md-2"><div>

Logging has two main purpose which are to monitor events

* 🔎 to detect suspicious activities
* ⚖️ to comply with investigations or legal regulations

We first need to identify what is generating logs

* Workstations <small>(Windows 10/11...)</small> and Servers
* Applications and databases
* Routers, Switches, Firewalls, Antivirus, IDS...
* ...

Then, we need to determine what's useful to log

* **User actions** 🧔: successful and failed login attempts, creation or suppression of users, change of permissions, privilege escalation <small>(su/sudo/runas)</small>
* **System actions** 💻: application/services started/stopped, startup and shutdown, change to system settings...
* **Application events** 🖨️: user actions, warnings, errors...
* **Network events** 📶: incoming/outgoing traffic...
</div><div>

As we will have many logs, we need to prioritize them

* **Priority 1**: critical events that require immediate intervention <small>(ex: system/IDS/antivirus crash, access to admin accounts...)</small>
* **Priority 2**: important events that require attention <small>(ex: failed login attempts, system/application warnings/errors...)</small>
* **Priority 3**: informal events <small>(ex: successful login attempts...)</small>

Then, the last step is to notify or alert that an event occurred, based on it's level of prioritization.

* **Notification** 📨: SMS, email, push notification... according to the priority; to the relevant parties
* The incident response team will handle the **Triage**, **Response**, and **Resolution**.

The minimal information needed to provide useful details are

* Date and time of the event 
* Source and destination IP addresses or hostnames 
* Event type or category <small>(e.g. login, file access, network traffic)</small>
* User ID <small>(if applicable)</small>
* Outcome of the event <small>(success or failure)</small>
</div></div>

<hr class="sep-both">

## Logging strategy

<div class="row row-cols-md-2"><div>

The logs can be collected

* with an agent (an additional software)
* without an agent (agentless)

➡️ Try to use native "services" such as syslog (if applicable).<br>➡️️ Ensure that clocks are synchronized

There are two methods to collect logs:

* Pull: the server requests the logs <small>(SFTP...)</small>
* Push: the entity sends its log without being requested <small>(syslog, snmp, using a script, SFTP...)</small>

👉 ️ We can use UDP to transfer logs if we can accept a potential loss, otherwise, TCP should be used instead.

It's possible to set up a **collector** that will collect the logs of a "zone", and will transfer them to the server. This has a cost, but allow a better use of the bandwidth. A collector can be Agent-based, Syslog-based, or Forwarding-based.
</div><div>

**Centralized logs**: using centralized logs is good to have a global and unified view on all logs.

* we must ensure that logs are not tampered
* we must closely monitor them to detect unusual activity
* we must ensure that the person accessing the logs (read/write) have the right to do it. For instance, if there are logs with critical data, their access should be restrained.
* it's recommended to keep a raw version of the logs

**SIEM**: Security Information and Event Management. A centralized logging solution that should detect attacks by correlating logs <small>(temporal, based on the source/destination...)</small> and alert/notify. A SIEM can also generate reports.

* Splunk
* Microsoft
* IBM
* ...

➡️ Search for "Gartner SIEM".
</div></div>