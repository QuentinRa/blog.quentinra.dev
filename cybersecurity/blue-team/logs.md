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

## XXX

<div class="row row-cols-md-2"><div>

centralized logs are good for users, but they must be secured to ensure that they are not tampered, and they must be closely monitored for the company to detect unusual activity as fast as possible.
</div><div>

...
</div></div>