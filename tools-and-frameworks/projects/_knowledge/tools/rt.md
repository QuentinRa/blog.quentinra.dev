# Request Tracker

[![keeper](../../../../cybersecurity/_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)

<div class="row row-cols-lg-2"><div>

[Request Tracker](https://bestpractical.com/request-tracker/) is an [open-source](https://github.com/bestpractical/rt) <small>(0.8k ⭐)</small> issue tracker developed by Best Practical. The pentesting usages are a copy of [osTicket](osticket.md) usages.

You can try to [brute force](/cybersecurity/red-team/s2.discovery/techniques/websites/account.md) credentials:

```
$ hydra -C ftp-betterdefaultpasslist.txt IP http-post-form "/rt/NoAuth/Login.html:user=^USER^&pass=^PASS^:F=incorrect" -V -f
```
</div><div>

As a pentester, compromising a ticketing platform is often handy.

* 🔑 We may gain access to valid emails, either to access company-only platforms or perform social attacks

* 💵 We may gain access to sensitive information

* 🔫 We may find usernames for other attacks

* 🔏 We may be able to create users
</div></div>