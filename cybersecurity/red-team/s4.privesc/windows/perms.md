# Privileges

[Go back](../index.md#windows-privilege-escalation-)

[![windowsprivesc20](../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-md-2"><div>

Users may have privileges for running some system tasks such as backups that may be used to escalate.

* List your privileges

```shell!
PS> whoami /priv
```
</div><div>

➡️ Privileges are [listed and explained here](https://learn.microsoft.com/en-us/windows/win32/secauthz/privilege-constants).

🔥 You can find [way to exploit them on Priv2Admin](https://github.com/gtworek/Priv2Admin) (1.4k ⭐).
</div></div>