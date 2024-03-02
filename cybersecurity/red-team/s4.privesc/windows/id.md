# Identification

<div class="row row-cols-lg-2"><div>

**Users**

* `whoami`: username
* `whoami /groups`: current user groups
* `whoami /priv`: current user privileges
* `Get-LocalGroup`+`net localgroup`: list groups
* `Get-LocalUser`: list users
* `net localgroup users`: list users in the group "users"
* `net user username`: info about a user
* `net localgroup administrators`: list administrators
</div><div>

**Machine**

* `ver` <small>(cmd-only)</small>: see Windows version
* `systeminfo`: info about the system <small>(OS+Product+System info...)</small>
* `hostname`: info about the host <small>(ex: `website-dev` -> role of the user)</small>
* `netstat`: see real-time networking requests
* `netstat -ano`: list connections
* `ls Env:`: see environment variables
* `wmic product get name,version,vendor`: list software installed using "normal" means, e.g., using the OS
</div></div>