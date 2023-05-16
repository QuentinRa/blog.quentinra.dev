# Identification

[Go back](../index.md#windows-privilege-escalation-)

<div class="row row-cols-md-2"><div>

**Users**

* `whoami`: username
* `whoami /groups`: your groups
* `Get-LocalGroup`: list groups
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
* `ls Env:`: see environment variables
* `wmic product get name,version,vendor`: list software installed using "normal" means, e.g., using the OS
</div></div>