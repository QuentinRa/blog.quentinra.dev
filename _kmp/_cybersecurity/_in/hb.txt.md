# ...

Social Media Intelligence (SOCMINT)
osintgram
https://www.csoonline.com/article/3445357/what-is-osint-top-open-source-intelligence-tools.html
https://github.com/mitchmoser/sputnik
Pulsedive
Talos
https://www.authentic8.com/blog/OSINT-2021-guide-tools-and-techniques?UTM=googlepaid&gclid=EAIaIQobChMI_t2F_5mI-gIVEY7ICh29eQ-HEAAYASAAEgJE5vD_BwE

Mxtoolbox
nexpose
https://whois.domaintools.com/
https://lookup.icann.org/en

intext: (password | passcode)

TrendMicro

hping3 -S IP -p port
SA = SynAck
RA = RstAck
--flood (send packets as fast as possible, no response)
-S = Syn

netdiscover -r IP
netdiscover -r IP/CIDR

nmap --badsum
Firewall Spotting
If there is a reponse, then a firewall/IDS responded.
--script-trace

acunetix
hp webinspect
fireeye
qualys
tenable.sc tenable.io

nikto is a web scanner
=> noisy
=> owasp

ES Linsniff Websniff Tcpdump Snoop Wireshark

https://cxsecurity.com/exploit/
https://www.vulnerability-lab.com/
http://www-.0day.today/
Security Focus (par Symantec)
Packet Storm Security

CCE (Common configuration Enumeration)
CPE (Common platform Enumeration)
XCCDF (Extensible Configuration Checklist Description Format)

Legion
 NMAP, whatweb, nikto,
Vulners, Hydra, SMBenum, dirbuster, sslyzer, webslayer
...

rlogin

QubesOS

adobe/fileformat/adobe_utilprintf

Top 10 • WebGoat • WebScarab • Testing guide • Code review guide • Mobile security testing guide • ZAP – Zed Attack Proxy

code URL open redirect in hexadecimal?

cookie not associated with an IP
website HTTP
no flag secure
WebDevelopper export cookies and test in another nav

https://github.com/exbotanical/brutus

/usr/share/windows-binaries/radmin.exe
-e x86/shikata_ga_nai
Veil Framework

Logic Flaw: the dev expect fields to remain unchanged.
Not all browsers are the same, we should test websites in multiple browsers.

Headers on redirect even with auto-routing.

https://chrome.google.com/webstore/detail/tamper-chrome-extension/hifhgpdkfodlpnlmlnmhchnkepplebkb
https://tamper.dev
https://pwning.owasp-juice.shop/part1/categories.html

Open firefox network tab before sending a request
Then, once the request was sent, you will see it inside even if the page changed.
You can

* resend a request
* edit a request and send it again (click on "use as fetch in console")

--exclude-length 1987
Error: the server returns a status code that matches the provided options for non existing urls. URL/xxxx-xxxx-xxxx-xxx => 200 (Length: 1987). To continue please exclude the status code or the length

https://github.com/iteratec/multi-juicer
https://pwning.owasp-juice.shop/

https://ctfd.io/
https://github.com/facebookarchive/fbctf
https://github.com/moloch--/RootTheBox

https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/
https://github.com/Arachni/arachni

https://juice-shop.github.io/juice-shop/#/

See my DM.

https://www.rapid7.com/products/nexpose/
https://www.qualys.com/free-services/
https://phoenixnap.com/blog/cybersecurity-experts-threats-trends

```
Array.from(document.querySelectorAll('a:not([hidden])')).map(e => {
let h = e.href
const name = h.substr(h.lastIndexOf("/")+1)
if (name === "") return 0;
if (!h.endsWith(".md")) h += "%2500.md"
const a = document.createElement('a')
a.setAttribute('href', h)
a.setAttribute('downlaod', name)
a.setAttribute('hidden', '')
a.setAttribute('target', '_blank')
document.body.appendChild(a)
a.click()
return 1
})
```

sudo apt install zaproxy
owasp-zap
https://www.kali.org/tools/kali-meta/
https://github.com/bettercap/bettercap
https://github.com/infobyte/evilgrade
https://github.com/Veil-Framework/Veil
https://github.com/vernjan/owasp-juice-shop

-T table
do you want to store hashes to a temporary file for eventual further processing with other tools [y/N] y
do you want to crack passwords?
what dictionary you want to use.
do you want to use common password suffixes? (slow!) [y/N] N

https://www.microsoft.com/en-us/software-download/windows11
https://software.download.prss.microsoft.com/dbazure/Win10_21H2_English_x64.iso
https://www.itechtics.com/windows-10-download-iso/