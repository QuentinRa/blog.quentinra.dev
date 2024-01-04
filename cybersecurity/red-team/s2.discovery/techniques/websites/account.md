# Account discovery

[![authenticationbypass](../../../../_badges/thmp/authenticationbypass.svg)](https://tryhackme.com/room/authenticationbypass)
![nibbles](../../../../_badges/htb-p/nibbles.svg)

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

* Try using `xxx+anything@xxx` to register multiple accounts with the 'same' address email `xxx@xxx`. It may be handy to 'farm' accounts.
</div></div>