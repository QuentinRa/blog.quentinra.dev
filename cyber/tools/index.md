# Cybersecurity

...

<hr class="sl">

## Bruteforce

The [SecLists GitHub Repository](https://github.com/danielmiessler/SecLists/) contains useful lists of usernames/passwords, payloads, urls, ...

<hr class="sr">

## BurpSuite

![Usage: Intercept, and edit requests](https://img.shields.io/badge/usage-Intercept,%20and%20edit%20requests-ffd700)

BurpSuite can be used to intercept a form, and apply some changes to it. You could automate this process. For instance, given a list of username, you can use BurpSuite to lunch a bruteforce attack.

<details class="details-e">
<summary>Intercept a form</summary>

Start a new project in BurpSuite and **start listening** (Proxy > Intercept > On). Then, open the page with the form in your browser.

You need to configure, and **enable, your browser proxy to redirect any requests to localhost** (127.0.0.1).

* Check your browser settings
* Or, use BurpSuite extension

Now, any request will be opened inside BurpSuite, in the tab target. Click on **Forward** to process request that you don't want to work on.

**Note**: if you try loading some webpage, but it takes a lot of time, that's because the request is pending in BurpSuite.
</details>

<details class="details-e">
<summary>Edit a payload</summary>

A payload is the form data that is stored in the request. For instance, when submitting a login form, you will most likely have: `username=toto&password=otot`. Once you intercepted such a request, instead of clicking on "forward", right-click on it, and select "sent to intruder". Then go to intruder tab.

* **Positions**: can be used to select attack mode, and injectable data
  * **Attack mode**: select cluster bomb
  * **Add "$"** before and after any injectable data. These blocks of "$something$" will be later referred with "$1" for the first block, "$2" for the second block...
* **Payload**: here you can select how to fill each of the injectable fields.

Start the attack. If a response is different from others, then it should be worth it to try it manually.

</details>

<hr class="sl">

## wfuzz

![Usage: Bruteforce GET URLs, and GET/POST forms](https://img.shields.io/badge/usage-Bruteforce%20GET%20URLs,%20and%20GET,%20or%20POST%20forms-ffd700)

You can use `wfuzz` to bruteforce a URL, mostly a GET URL, meaning an URL like `/account/4d5z` or `/account?id=4d5z`. You can install wfuzz using pip, or use the docker image. [See the official documentation here](https://wfuzz.readthedocs.io/en/latest/index.html). **The command `wfuzz` is quite simple: given a list of word, and a URL, the command will replace the word `WFUZZ` in the URL, with each word in the list of words**.

```bash
# replace FUZZ in the URL 'https://xxx.tld/account/FUZZ' with every word (one word=one line) in common.txt
wfuzz -w common.txt xxx.tld/account/FUZZ
wfuzz -w common.txt xxx.tld:443/account/FUZZ

# if HTTP
wfuzz -w common.txt xxx.tld:80/account/FUZZ
# ignore 404
wfuzz -w common.txt --hc 404 xxx.tld/account?id=FUZZ
# show only http_code=200
wfuzz -w common.txt --sc 200 xxx.tld/account?id=FUZZ

# try bruteforce 'admin' with password in common_pass
wfuzz -w common_pass.txt -d "uname=admin&pass=FUZZ" xxx.tld/login.php
```

<details class="details-e">
<summary>Details</summary><br>

<details class="details-e">
<summary>Using docker</summary>

If you are using docker (easy to install with Docker Hub on Windows):

* `docker pull ghcr.io/xmendez/wfuzz`
* `docker run -it ghcr.io/xmendez/wfuzz wfuzz -h` (wfuzz -h)
</details>

<details class="details-e">
<summary>Useful Parameters</summary>

* `-w path`: a path to a file with a list of word (one per line)
* `--d "uname=FUZZ"`: for a post request
* `-z`: specify the kind of payload (ex: file, stdin...). Read the documentation.
</details>

<details class="details-e">
<summary>Parameters to reduce the number of results</summary>

You can reduce the number of requests shown after fuzzing. You have

* `--hl n`: hide results for which the number of lines is not `n`
* `--sl n`: show results only if the number of lines is  `n`

You got `l` for lines, `-w` for words, `h` for characters, `c` for HTTP code. You can specify multiples values by separating them with `,` (comma).
</details>
</details>

<hr class="sr">

## gobuster

![Usage: Bruteforce GET URLs](https://img.shields.io/badge/usage-Bruteforce%20GET%20URLs-ffd700)

This tool can be used to bruteforce URLs, written in GO, it's supposedly internally more efficient, and robust. Check [GoBuster repository on GitHub](https://github.com/OJ/gobuster).

```bash
# gobuster dir -u url -w wordlist.txt -x extension, extension
gobuster dir -u 127.0.0.1 -w wordlist.txt -w php
gobuster dir -u domain.com -w wordlist.txt -w php
# if "wordlist.txt" has the word "toto", then gobuster will try
# 127.0.0.1/toto.php (resp. domain.com/toto.php)

# multiple extensions
gobuster dir -u 127.0.0.1 -w wordlist.txt -w php, html
# 127.0.0.1/toto.php
# 127.0.0.1/toto.html
```

<hr class="sl">

## SQLMap

![Usage: Map DataBase](https://img.shields.io/badge/usage-Map%20DataBase-ffd700)

From the [SQLMap GitHub Repository](https://github.com/sqlmapproject/sqlmap): "sqlmap is an open source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers.".

```py
# try login.php
sqlmap -u "https://xxx.tld/login.php"
# try to dump the table USERS in the database xxx
sqlmap -u "https://xxx.tld/login.php" -D xxx -T USERS –dump
```

<details class="details-e">
<summary>Parameters</summary>

* `--url URL_TO_TEST`: test a URL in which we may find a SQL injection
* `-r request_file`: if you saved a request (ex: BurpSuite > Save item), you can use that instead of `--url`, **that your antivirus may block**.
* `--dbs`: display all databases
* `--tables`: display tables
* `--column`: display columns
* `-C xx, yy`: display only columns xx, and yy
* `--dbms=some_dmbs`: to increase the chances of success, specify the dbms
* `-D db_name`: the name of the database
* `--time-sec timeout`: specify a timeout
* `--dump`: save current data
* `--dump-all`: save all data
* `--batch`: do all requests at once (do not way for input)
</details>

When starting the command, you will have to do some choices.

* You should try doing both with, and without union tests, to see which one is better in your current case
* "GET xxx is vulnerable" (resp. POST): you should answer yes if you want to exploit the vulnerable parameter
* [SQLMap CheatSheet](https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet) (external)

<hr class="sr">

## enum4linux

![Usage: Enumerating Information](https://img.shields.io/badge/usage-Enumerating%20Information-ffd700)

I don't know if there is still an `enum.exe`, because I can't find it, but you can use the tool [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) for enumerating information from Windows, and Samba hosts.

```bash
$ ./enum4linux.pl <options> <ip>
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : os data
# -i : printer data
# -v : verbose
```

<hr class="sl">

## Metasploit (metasploit-framework)

![Usage: Penetration testing](https://img.shields.io/badge/usage-Penetration%20testing-ffd700)

* [THM Metasploit (2019)](https://tryhackme.com/resources/blog/metasploit)

The [Metasploit Framework](https://github.com/rapid7/metasploit-framework) ([setup debian](https://computingforgeeks.com/install-metasploit-framework-on-debian/)) is a penetration testing framework that you can use to test your systems.

```bash
$ mfsconsole -q
# search a service/module (ex: apache)
mfs6 > search <service_or_module>
# select a module
mfs6 > use <module>
# list selected module's options
msf6 exploit('module_used') > options
msf6 exploit('module_used') > show options
# set it's options
msf6 exploit('module_used') > set <option> <valeur>
# start exploit
msf6 exploit('module_used') > run
```

<details class="details-e">
<summary>Usual modules options</summary>

* `set LHOST <value>`: ip of the attacker
* `set RHOST(s) <value>`: ips of the defenders
* `set RPORT <value>`: port of the defender
* `set TARGETURI <value>`: an URI (ex: location to a script)
* `set use <module>`: use another module
* `set PAYLOAD <value>`: use another module
</details>