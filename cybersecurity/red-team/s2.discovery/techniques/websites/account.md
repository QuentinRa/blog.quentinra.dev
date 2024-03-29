# Account discovery

[![authenticationbypass](../../../../_badges/thmp/authenticationbypass.svg)](https://tryhackme.com/room/authenticationbypass)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day3.svg)](https://tryhackme.com/room/adventofcyber2)
[![surfer](../../../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)
[![bruteit](../../../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)
![nibbles](../../../../_badges/htb-p/nibbles.svg)
[![keeper](../../../../_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)
[![weak_password](../../../../_badges/rootme/web_server/weak_password.svg)](https://www.root-me.org/en/Challenges/Web-Server/Weak-password)

<div class="row row-cols-lg-2"><div>

Account discovery is a self-made name to categorize techniques to find users that have an account of the website.

* 🐟 Try digging in the API (if any)
* 👀 Try testing emails in the password forgot page
* 🙌 Try testing emails in the register page
* 📚 Try to find exposed configuration files
* ...

We often test weak or mostly default credentials. You can do it manually, or use [Fuzzing](fuzzing.md) with these [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md#accounts).
</div><div>

**Additional notes** 🔥

* Brute forcing accounts is usually done if there is nothing else we can try, while fuzzing for default credentials is acceptable.

Refer to use [Fuzzing](fuzzing.md) or [network authentification tools](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md) such as hydra, which may also be used to brute force forms.

* Try using `xxx+anything@xxx` to register multiple accounts with the 'same' address email `xxx@xxx`. It may be handy to 'farm' accounts.
</div></div>