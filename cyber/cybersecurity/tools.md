# Cybersecurity

This is a list of every tool, repository, or program that you may use across every other sub-courses, or while working in cybersecurity. The list may be incomplete if some commands are introduced directly in other courses such as 'Cybersecurity - commands', or 'Linux - networking'.

<hr class="sl">

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

<hr class="sr">

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

<hr class="sl">

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

## Volatility

![Usage: Forensics tool](https://img.shields.io/badge/usage-Forensics%20tool-ffd700)

<div class="row row-cols-md-2"><div>

Volatility is a free memory forensics tool.

<details class="details-e">
<summary>Install on Linux</summary>

It wouldn't work with `apt-get install volatility` on Kali-2022, so I had to do things manually, and it was tiring because it uses python2. There is a version for [python3](https://github.com/volatilityfoundation/volatility3/tree/stable) in development.

* `git clone https://github.com/volatilityfoundation/volatility.git`
* First patch ([source](https://alvinisonline.medium.com/volatility-importerror-no-module-named-crypto-hash-e515092fd8e3))
  * `curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py`
  * `sudo python2 get-pip.py`
  * `sudo apt-get install build-essential libssl-dev libffi-dev python2-dev`
* Second patch
  * `pip2 install pycryptodome`
  * `pip2 install --upgrade setuptools`
  * `pip2 install distorm3`
  * `python2 vol.py -h`
* You should add an alias: `alias vol='python2 /path/to/vol.py'`
* `vol -h`
</details>

In order to use Volatility, you need a memory capture (usually, a .raw file). Try checking out [FTK Imager](https://accessdata.com/product-download/ftk-imager-version-4-2-0), [Redline](https://www.fireeye.com/services/freeware/redline.html), [DumpIt.exe](https://www.aldeid.com/wiki/Dumpit), [winDD](https://sourceforge.net/projects/windd/)...

Volatility need to know on which version of Windows it should base its analysis. It's called profiles, and you can run `imageinfo` to find which profiles you can use.

```bash
$ vol -f memory_capture_file imageinfo
# Suggested Profile(s): ...
```

If the following commands are working, then the profile you took is the right one. You can view active processes/connections

```bash
# processes
$ vol -f memory_capture_file --profile=a_profile pslist
# connections
$ vol -f memory_capture_file --profile=a_profile netscan
# hidden processes
$ vol -f memory_capture_file --profile=a_profile psxview
# both actives, and actives+hidden
vol -f memory_capture_file --profile=a_profile ldrmodules > output
```

</div><div>

Malicious processes will most likely try to hide themselves. If you process is neither InLoad, InInit, InMem, then it's suspicious. You can use grep on the output to check if there is a process like this.

```bash
$ grep -o '^.*False.*False.*False.*' output
```

Processes aren't the only place to inspect. We can also check for unexpected patches in the standard system DLLs.

```bash
$ vol -f memory_capture_file --profile=a_profile apihooks
```

Look for injected code, and dump it

```bash
$ vol -f memory_capture_file --profile=a_profile malfind -D dest
```

View all the DLLs loaded into memory

```bash
$ vol -f memory_capture_file --profile=a_profile dlllist
# dump them
$ vol -f memory_capture_file --profile=a_profile --pid=infected_process_pid dlldump -D dest
```
</div></div>

Volatility
https://subscription.packtpub.com/book/security/9781838640804/10/ch10lvl1sec55/using-volatility-in-kali-linux
https://youtu.be/dB5852eAgpc

* Inpect files - dump all processes, and ddl
  * https://www.virustotal.com/gui/home/upload
  * https://www.hybrid-analysis.com/
* AlienVault Open Threat Exchange (OTX) - An open-source threat tracking system
* SANS 408 - Windows Forensic Analysis
* https://github.com/stuxnet999/MemLabs