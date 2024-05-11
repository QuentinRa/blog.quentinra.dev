# Account discovery

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)
[![authenticationbypass](../../../../_badges/thmp/authenticationbypass.svg)](https://tryhackme.com/room/authenticationbypass)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day3.svg)](https://tryhackme.com/room/adventofcyber2)
[![surfer](../../../../_badges/thm-p/surfer.svg)](https://tryhackme.com/r/room/surfer)
[![bruteit](../../../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)
[![marketplace](../../../../_badges/thm-p/marketplace.svg)](https://tryhackme.com/r/room/marketplace)
![nibbles](../../../../_badges/htb-p/nibbles.svg)
[![keeper](../../../../_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)
[![weak_password](../../../../_badges/rootme/web_server/weak_password.svg)](https://www.root-me.org/en/Challenges/Web-Server/Weak-password)

<div class="row row-cols-lg-2"><div>

Account discovery is a self-made name to categorize techniques to find users that have an account of the website.

* 🐟 Try digging in the API (if any)
* 👀 Try testing emails in the password forgot page
* 🙌 Try testing emails in the register page
* 📚 Try to find exposed configuration files
* ✈️ Try to create an account
* ...

We often test weak or mostly default credentials. You can do it manually, or use [Fuzzing](fuzzing.md) with these [wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md#accounts).
</div><div>

**Additional notes** 🔥

* Brute forcing accounts is usually done if there is nothing else we can try, while fuzzing for default credentials is acceptable.

Refer to use [Fuzzing](fuzzing.md) or [network authentification tools](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md) such as hydra, which may also be used to brute force forms.

* Try using `xxx+anything@xxx` to register multiple accounts with the 'same' address email `xxx@xxx`. It may be handy to 'farm' accounts.
</div></div>

<hr class="sep-both">

## Username Enumeration

<div class="row row-cols-lg-2"><div>

#### Username Enumeration — Login Page

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

Some websites return a different message when the username was not found and when the password is incorrect, helping in enumeration.

Most websites are computing the hash at each login. If they are using an algorithm "slow enough" <small>(rare)</small> and only doing it if a user exists, then delays in responses may indicate that a user exists.

While rare, some websites prefill fields only if the user exists.

<br>

#### Username Enumeration — Register Page

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

We can't register an account with an already taken username or email. It can be exploited to enumerate usernames.
</div><div>

#### Username Enumeration — Password Forgot/Reset Page

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

Websites may indicate if a user exists when we try to reset a password.
</div></div>

<hr class="sep-both">

## Log In Page

<div class="row row-cols-lg-2"><div>

#### Log In Page — Rate Limit

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

Some websites are implementing a rate timer often using a super increasing wait time. If they are checking the `X-Forwarded-For` to avoid blocking proxies, it means we can arbitrary pick an IP to "ban".
</div><div>
</div></div>

<hr class="sep-both">

## Password Reset

<div class="row row-cols-lg-2"><div>

#### Password Reset — Predictable Token

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

Reset tokens associated with a request to reset a user account should be randomly generated. Some are using predictable values:

* 🪓 Some hashing function: `md5(username)`
* 🗺️ Some short number: `12345`
* 🪦 Some temporary password based on known data
* 🚧 Some known values to the user, such as with [CVE-2016-0783](https://nvd.nist.gov/vuln/detail/CVE-2016-0783)

```php!
$time = intval(microtime(true) * 1000);
$token = md5($username . $time);
```

Most servers are returning a Date Header with the date of the server. We only need to brute force the microsecond.

```py
time_string = "Sat, 04 May 2024 09:35:52 GMT"
format_string = "%a, %d %b %Y %H:%M:%S %Z"
dt_object = datetime.datetime.strptime(time_string, format_string)
dt_object = pytz.timezone('GMT').localize(dt_object)
base_epoch_ms = int(dt_object.timestamp() * 1000)
for epoch_ms in range(base_epoch_ms - 1000, base_epoch_ms + 1000 + 1):
    token = hashlib.md5(('username' + str(epoch_ms)).encode()).hexdigest()
    # test the token
```
</div><div>

#### Password Reset — Security Questions

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

Some websites are allowing security questions, often from a pre-determined set of questions to avoid users using weak questions.

The problem is that some questions can be easily answered using OSINT or brute forced when the question has limited answers.

Refer to [security question wordlists](/cybersecurity/red-team/_knowledge/topics/wordlists.md).

<br>

#### Password Reset — Birthday_problem

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

If an application is using a lot of tokens and the tokens are not long enough, two users may get the same token [as per this](https://en.wikipedia.org/wiki/Birthday_problem).
</div></div>